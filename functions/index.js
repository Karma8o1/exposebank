// variable for using firebase functions
const functions = require("firebase-functions");
//Initialized firebase admin to check firebase data
const admin = require('firebase-admin');
//
const Flutterwave = require('flutterwave-node-v3');
const flw = new Flutterwave(process.env.FLW_PUBLIC_KEY, process.env.FLW_SECRET_KEY);

admin.initializeApp();
exports.sendUserNotification = functions.https.onCall(async (data, context)=>{
    const registrationToken = data.registrationToken;
    const message = {
        data: {
          score: '850',
          time: '2:45'
        },
        token: registrationToken
      };
    getMessaging().send(message)
    .then((response) => {
    // Response is a message ID string.
    console.log('Successfully sent message:', response);
    })
    .catch((error) => {
    console.log('Error sending message:', error);
    });

})
exports.createNewAccount = functions.https.onCall(async(data, context)=>{
})