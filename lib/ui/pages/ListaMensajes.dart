import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:crypto_misiontic_2022/domain/data/mensajes.dart';
import 'package:crypto_misiontic_2022/domain/data/mensaje_data.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:crypto_misiontic_2022/ui/pages/mensajeWidget.dart';



class ListaMensajes extends StatefulWidget {

  ListaMensajes({Key? key}) : super(key: key);
  final mensajeData = MensajeData();

  @override
  ListaMensajesState createState() => ListaMensajesState();
}

class ListaMensajesState extends State<ListaMensajes> {

  ScrollController _scrollController = ScrollController();
  TextEditingController _mensajeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollHaciaAbajo());

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Usuarios', style: TextStyle(color: Colors.black)),
          foregroundColor: Colors.black,
          backgroundColor: Color(0xffff9332),),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
                children: [
                  _getListaMensajes(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child:  Container (
                                    color: Color(0xffff9332),
                                    padding: EdgeInsets.all(7.0),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    controller: _mensajeController,
                                    onChanged: (text) => setState(() {}),
                                    onSubmitted: (input) {
                                      _enviarMensaje();
                                    },
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Mensaje'
                                    )
                                )
                                )
                            )
                        ),
                        IconButton (
                            icon: Icon(_puedoEnviarMensaje() ? CupertinoIcons.arrow_right_circle_fill :
                            CupertinoIcons.arrow_right_circle),
                            color: Color(0xffff9332),
                            onPressed: () {
                              _enviarMensaje();
                            }
                        )
                      ]
                  ),
                ]
            )
        )
    );

  }

  void _enviarMensaje() {
    if (_puedoEnviarMensaje()){
      final mensaje = Mensaje(_mensajeController.text, DateTime.now());
      widget.mensajeData.guardarMensaje(mensaje);
      _mensajeController.clear();
      setState(() {});
    }
  }

  bool _puedoEnviarMensaje() => _mensajeController.text.length > 0;

  Widget _getListaMensajes() {
    return Expanded(
        child: FirebaseAnimatedList(
          controller: _scrollController,
          query: widget.mensajeData.getMensajes(),
          itemBuilder: (context, snapshot, animation, index) {
            final json = snapshot.value as Map<dynamic, dynamic>;
            final mensaje = Mensaje.fromJson(json);
            return MensajeWidget(mensaje.texto, mensaje.fecha);
          },
        )
    );
  }

  void _scrollHaciaAbajo() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}
