// variable for using firebase functions
const functions = require("firebase-functions");
//Initialized firebase admin to check firebase data
const admin = require('firebase-admin');
// The Firebase Admin SDK to access Firestore.
admin.initializeApp();

const db = admin.firestore();


exports.messageNotificationTrigger = (change, context) => {

  db.collection('usersData').get().then((snapshot) => {
    snapshot.docs.forEach(doc => {

      const userData = doc.data();

      if (userData.id == '<YOUR_USER_ID>') {
         admin.messaging().sendToDevice(userData.deviceToken, {
           notification: {
             title: 'Notification title', body: 'Notification Body'}
           });
      }
    });
  });
};