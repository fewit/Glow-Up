const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("Glow_Up_User/" + user.uid);
  await firestore.collection("Glow_Up_User").doc(user.uid).delete();
  await firestore
    .collection("Glow_Up_Post")
    .where("Glow_Up_CreateUser", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection Glow_Up_Post`);
        await doc.ref.delete();
      }
    });
  await firestore
    .collection("Glow_Up_PostComment")
    .where("Glow_Up_CreateUser", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(
          `Deleting document ${doc.id} from collection Glow_Up_PostComment`,
        );
        await doc.ref.delete();
      }
    });
  await firestore
    .collection("Glow_Up_Chat")
    .where("Glow_Up_ChatUsers", "array-contains", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection Glow_Up_Chat`);
        await doc.ref.delete();
      }
    });
  await firestore
    .collection("Glow_Up_ChatMessages")
    .where("Glow_Up_SendUser", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(
          `Deleting document ${doc.id} from collection Glow_Up_ChatMessages`,
        );
        await doc.ref.delete();
      }
    });
});
