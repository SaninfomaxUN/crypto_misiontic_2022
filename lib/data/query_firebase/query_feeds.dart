import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_misiontic_2022/data/model/feed_model.dart';

class QueryFeed {
  static final firebaseInstance = FirebaseFirestore.instance;
  static final CollectionReference _mainCollection = firebaseInstance.collection('feeds');
  static int? lenghtCollection;

  static void agregarFeed(FeedModel feedToAdd) {
    lenghtCollection = 1;
    firebaseInstance.collection("feeds").doc(lenghtCollection.toString()).set({
      "idFeed": lenghtCollection.toString(),
      "idUser": feedToAdd.idUser.toString(),
      "userName": feedToAdd.userName,
      "hour": feedToAdd.hour,
      "pic": feedToAdd.pic,
      "isFav": feedToAdd.isFav,
      "textContent": feedToAdd.textContent,
      "picContent": feedToAdd.picContent
    });
  }

  static FeedModel buscarFeeds(int position) {
    FeedModel datoExtraido = FeedModel.empty();
    firebaseInstance.collection("feeds").where(FieldPath.documentId, isEqualTo: position.toString()).snapshots().listen((resultado) {
      resultado.docs.forEach((elementos) {
        if(elementos==null){
          //print("F" + position.toString());
        }else{
          //print("B" + position.toString());
          datoExtraido = FeedModel(
              elementos['idFeed'],
              elementos['idUser'],
              elementos['userName'],
              elementos['hour'],
              elementos['pic'],
              elementos['isFav'],
              elementos['textContent'],
              elementos['picContent']);
          //print(datoExtraido.idUser);
        }
      });
    });
    return datoExtraido;
  }


  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
    _mainCollection.doc(lenghtCollection.toString()).collection('items');

    return notesItemCollection.snapshots();
  }
}