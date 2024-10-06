const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("User_Collection/" + user.uid);
  await firestore.collection("User_Collection").doc(user.uid).delete();
});
