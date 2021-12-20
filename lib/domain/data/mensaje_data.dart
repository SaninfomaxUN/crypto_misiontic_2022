import 'package:firebase_database/firebase_database.dart';
import 'mensajes.dart';

class MensajeData {

  final DatabaseReference _mensajesRef = FirebaseDatabase.instance.reference()
      .child('mensajes');

  void guardarMensaje(Mensaje mensaje) {
    _mensajesRef.push().set(mensaje.toJson());
  }

  Query getMensajes()=> _mensajesRef;

  vodiGetMensajes()=> _mensajesRef;

}