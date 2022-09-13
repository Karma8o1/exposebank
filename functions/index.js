// variable for using firebase functions
const functions = require('firebase-functions');
// import functions from "firebase-functions";
//Initialized firebase admin to check firebase data
// import { initializeApp, firestore as admin } from 'firebase-admin';
const admin = require('firebase-admin');
// The Firebase Admin SDK to access Firestore.
admin.initializeApp();

exports.sendNotification = functions.https.onCall((data,context)=>{
  const message = {
    data: {
      title: 'Hello',
      desc: 'Testing'
    },
    token: 'fjAocdXLRJKvFqURLjaS0p:APA91bHbebjihiu-l9fbB7nFR4kLoQUWn3ALhD6RdI64ip7zY5ojlMXCK2uRlo3N8w_HJwgcdLJdh7k0c6hEs8FDY09pPsEQC_kk8CkC_wAC8suOJ0NMbL_1_pomdqlg4YNsn1HdX5rL'
  };
  admin.messaging.message(message).then((response)=>{
    console.log(response);
  })
  admin.messaging.sendMulticast(message)
.then((response) => {
  // Response is a message ID string.
  console.log('Successfully sent message:', response);
})
.catch((error) => {
  console.log('Error sending message:', error);
});
});
//callable function for new transaction
exports.fundsTransfer = functions.https.onCall((data,context)=>{
  //check the auth state of user
  if(!context.auth){
    throw new functions.https.HttpsError('unauthenticated','user must log in before using this function');
  }
  //sender reference
  const senderRef = admin.firestore().collection('userData').doc(data.senderId).get().then(doc => {
    doc.data().notificationToken;
  });
  const recieverRef = admin.firestore().collection('userData').doc(data.recieverId).get().then(doc => {
    doc.data().notificationToken;
  });
  const message = {
    data: {
      title: data.title,
      desc: data.description
    },
    token: [senderRef, recieverRef]
  };
  // Send a message to the device corresponding to the provided
// registration token.
admin.messaging.sendMulticast(token,message)
.then((response) => {
  // Response is a message ID string.
  console.log('Successfully sent message:', response);
})
.catch((error) => {
  console.log('Error sending message:', error);
});
  return ('senderRef: '+senderRef + 'reciverRef: '+recieverRef);
})