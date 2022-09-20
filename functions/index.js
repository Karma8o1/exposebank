// variable for using firebase functions
const functions = require('firebase-functions');
// import functions from "firebase-functions";
//Initialized firebase admin to check firebase data
// import { initializeApp, firestore as admin } from 'firebase-admin';
const admin = require('firebase-admin');
// The Firebase Admin SDK to access Firestore.
//payment gateway flutterwave sdk
const Flutterwave = require('flutterwave-node-v3');
//axios to convert json automatically
const axios = require('axios');
//initialize firebase application
admin.initializeApp();

// const flw = Flutterwave(process.env.FLW_PUBLIC_KEY_TEST, process.env.FLW_SECRET_KEY_TEST);
exports.createVirtualAccount = functions.https.onCall(async(data,context)=>{
const flw = Flutterwave('FLWPUBK_TEST-514627bdd74d889e14abc53a87b293b1-X', 'FLWSECK_TEST-44bd0e0c940dac0063747fa312b2e17a-X');

  try {
    var data = {
      "email": data.email,
        "is_permanent": false,
        "bvn": "123456789010",
        "tx_ref": 'txt_ref12032',
        "phonenumber": data.phoneNumber,
        "firstname": data.firstName,
        "lastname": data.lastName,
    };
    await flw.VirtualAcc.create(data).then((value)=>{
      return value;
    });
} catch (error) {

    return(`Some errors occured on server side: ${response.error}`);
}
});
exports.sendFlutterWaveOTP = functions.https.onCall(async(data,context)=>{
  var data = JSON.stringify({
    "length": 7,
    "customer": {
      "name": "Flutterwave OTP",
      "email": data.emailAddress,
      "phone": data.phoneNumber
    },
    "sender": "Flutterwave Inc.",
    "send": true,
    "medium": [
      "email",
      "whatsapp"
    ],
    "expiry": 5
  });
  
  var config = {
    method: 'post',
    url: 'https://api.flutterwave.com/v3/otps',
    headers: {
      'Authorization': 'Bearer  ',
      'Content-Type': 'application/json'
    },
    data : data
  };
  
  axios(config)
  .then(function (response) {
    console.log(JSON.stringify(response.data));
  })
  .catch(function (error) {
    console.log(error);
  });
  
});
exports.sendJointAccountRequest = functions.https.onCall(async(data,context)=>{
  await admin.messaging().sendMulticast({
    tokens:data.tokens,
    notification: {
      title: data.title,
      body: data.body,
    },
  });
  return `the user token: ${data.token}`;
});