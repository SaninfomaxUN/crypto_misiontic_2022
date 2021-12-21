import 'dart:math';
import 'package:crypto_misiontic_2022/ui/pages/crear_feeds.dart';
import 'package:crypto_misiontic_2022/ui/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:crypto_misiontic_2022/ui/pages/mensajeWidget.dart';
import 'package:crypto_misiontic_2022/ui/pages/listamensajes.dart';

class HomePageController extends GetxController{

  signOut() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    await _firebaseAuth.signOut();
  }
  //------Indice BottomBar Seleccionado------------
  int selectedIndex = 0;

  //------Data Almacenada------------
  var estructuraAlmacenada = {"username":"","imageProfile":"","textFeed":"","imageFeed":""}.obs;
  var mapData = {0:{"username":"París Saint-Germain","imageProfile":"psg.png","textFeed":"","imageFeed":"psgCrypto.jpg"},
    1:{"username":"H","imageProfile":"psgCrypto.jpg","textFeed":"Texto de Prueba :)","imageFeed":"psgCrypto3.jpg"}}.obs;

  var string = "Hola".obs;

  void onItemTapped(int index) {
      selectedIndex = index;
      if(index==0){
        redireccionarMensajeria();
      }else{
        mostrarMantenimiento();
      }

      update();
    }
  void changeScreenNewMessage(){
    Get.to(() => CrearFeed(),transition: Transition.leftToRight);
  }


  void selectorMenu(String opcionSeleccionada,int contadorIndiceFeeds){
    //print(opcionSeleccionada);
    if(opcionSeleccionada=="eliminar"){
      Get.dialog(
        AlertDialog(
          title: const Text('Esta seguro que desea eliminar la publicación?'),
          actions: <Widget>[
            TextButton(
              onPressed: Get.back,
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed:  () => eliminarFeed(contadorIndiceFeeds),
              child: const Text('OK'),
            ),
          ],
        ),
//        barrierDismissible: false,
      );
    }
  }

    void eliminarFeed(int contadorIndiceFeeds){
    mapData.remove(contadorIndiceFeeds);
    reorganizarMap();
    Get.back();
  }

   void reorganizarMap(){
    RxInt len = 0.obs;
    RxMap<int, Map<String, String>> newMap = {0: {"":""}}.obs;
    mapData.forEach((oldK,v) => agregarMap(newMap, v, len));
    mapData = newMap;
   }
   void agregarMap(Map map, Map<String, String>  v, RxInt len){
    map[len.value] = v;
    len.value++;
   }

  //-----Generador Feeds
  Container generarFeed(int contadorIndiceFeeds){

      var mapUser = mapData[contadorIndiceFeeds];
      //print(mapUser);
      bool visibilityText = true;
      if( mapUser?["textFeed"] == ""){
        visibilityText = false;
      }
      return crearFeedIndiv(contadorIndiceFeeds,mapUser?["username"] ?? '', mapUser?["imageProfile"] ?? '', visibilityText, mapUser?["textFeed"] ?? '', mapUser?["imageFeed"] ?? '');

  }


  //-----Creador Feeds
  Container crearFeedIndiv(int contadorIndiceFeeds, String username, String imageProfile,bool isTextFeed, String textFeed, String imageFeed){
    return Container(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 400,
        ),

        child:
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.white,
          ),
          //height: 450,
          margin: const EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0,bottom: 5.0),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      topLeft: Radius.circular(25.0)
                  ),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 50,
                        maxWidth: 100,
                      ),
                      child:
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage('assets/images/'+imageProfile),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child:
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                username,
                                style: GoogleFonts.atomicAge(
                                    color: const Color(0xFF3A3434),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)
                            ),
                            Row(
                                children: <Widget>[
                                  Text(
                                      "8:45 am",
                                      style: GoogleFonts.roboto(
                                          color: const Color(0xFF888888),
                                          fontSize: 12)
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(0),
                                    child:
                                    IconButton(
                                      color: const Color(0xFF676767),
                                      icon: const Icon(Icons.add_circle),
                                      iconSize: 18,
                                      onPressed: mostrarMantenimiento,
                                    ),

                                  )
                                ]
                            )
                          ]
                      ),
                    ),


                    Expanded(
                      child:
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25.0)
                          ),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.only(right: 10.0),
                        height: double.infinity,
                        child:
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                  child:
                                  IconButton(
                                    color: Colors.red,
                                    icon: const Icon(Icons.favorite),
                                    iconSize: 35,
                                    onPressed: mostrarMantenimiento,
                                  ),),
                              /*Flexible(
                                child:
                                IconButton(
                                  color: Color(0xFF676767),
                                  icon: Icon(Icons.forward_to_inbox),
                                  iconSize: 35,
                                  onPressed: null,
                                ),),*/
                              Flexible(
                                child:
                                IconButton(
                                  color: const Color(0xFF676767),
                                  icon: const Icon(Icons.share),
                                  iconSize: 35,
                                  onPressed: mostrarMantenimiento,
                                ),),
                              Flexible(
                                child:
                                  PopupMenuButton(
                                    itemBuilder: (BuildContext bc) => [
                                      const PopupMenuItem(
                                          child: Text("Guardar"), value: "/newchat"
                                      ),
                                      const PopupMenuItem(
                                        child: Text("Reportar"), value: "/new-group-chat"
                                      ),
                                      const PopupMenuItem(
                                          child: Text("Eliminar"), value: "eliminar"
                                      ),
                                    ],
                                    onSelected: (route) {
                                      selectorMenu(route.toString(),contadorIndiceFeeds);
                                    },
                                  ),
                              ),

                            ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              isTextFeed ? LimitedBox (
                  maxHeight: 150,
                  child:
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
                      child:
                        Text(textFeed,style: const TextStyle(fontSize: 19, fontFamily: 'roboto'),textAlign: TextAlign.center,),
                  ),
              ): Container(),
              LimitedBox (
                  maxHeight: 450,

                  child:
                  Image.asset(
                      'assets/images/'+imageFeed,
                      fit:BoxFit.fitWidth
                  )
              ),

              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0)
                  ),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 50,
                        maxWidth: 100,
                      ),
                      child:
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.question_answer,
                                color: Color(0xFF676767),
                                size: 45,),
                                onPressed: mostrarMantenimiento,
                              ),

                              Text(
                                  "Ver 52 Comen..",
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xFF888888),
                                      fontSize: 12)
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),



                    Expanded(
                      child:
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25.0)
                          ),
                          color: Colors.white,
                        ),
                        height: 100,
                        child:
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    border: Border.all(width: 1.0, color: const Color(0xFF888888)),
                                    color: const Color(0xFFEBEBEB),
                                  ),

                                  child: const TextField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                        hintText: 'Agregar un comentario...',

                                        hintStyle: TextStyle(color: Color(0xFF888888))),
                                  ),
                                ),
                              ),


                              IconButton(
                                color: Color(0xFF888888),
                                icon: const Icon(Icons.send_rounded),
                                iconSize: 40,

                                onPressed: mostrarMantenimiento,
                              )
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  //MANTENIMIENTO
  void mostrarMantenimiento(){
    Get.dialog(
      AlertDialog(
        title: const Text('Lo sentimos. Esta sección se encuentra en construcción :('),
        content: const Icon(Icons.construction,size:40,color: Color(0xFFEC9D00)),
        actions: <Widget>[
          TextButton(
            onPressed: Get.back,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }


  //Redireccionar a Mensajes

  void redireccionarMensajeria(){
    Get.to(()=> ListaMensajes(),transition: Transition.leftToRight);
  }
}
