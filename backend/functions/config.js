const firebase = require("firebase");
const firebaseConfig = {
  apiKey: "AIzaSyAiwiqVtC0bAVNm2qP9tJqInKPa5KOobnQ",
  authDomain: "masala-a96ed.firebaseapp.com",
  projectId: "masala-a96ed",
  storageBucket: "masala-a96ed.appspot.com",
  messagingSenderId: "627267721851",
  appId: "1:627267721851:web:9ef14dec7f5ce5e93fa0de",
  measurementId: "G-WP1TCMK44X"
};
firebase.initializeApp(firebaseConfig);
const db = firebase.firestore();
const User = db.collection("Users");
module.exports = User;