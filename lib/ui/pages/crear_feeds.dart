import 'dart:io';

import 'package:crypto_misiontic_2022/domain/controllers/crear_feeds_controller.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

//----------------------------Pantala Crear Feeds------------------------------------------------------

class CrearFeed extends StatelessWidget {
  int selectedIndex = 0;



  @override
  Widget build(BuildContext context) {

    return GetX<CrearFeedsController>(
        builder: (crearFeedsController) =>GestureDetector(
            onTap: crearFeedsController.closeAllKeyboards,
            child:Scaffold(
          backgroundColor: const Color(0xFF3A3434),
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: const Color(0xFF3A3434),
            title: Row(
              children: <Widget>[
                Flexible(
                    child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),),

                const Flexible(
                    child: Text(
                      "Crypto",
                      style: TextStyle(color: Color(0xFFFEB801), fontSize: 30, fontFamily: 'roboto'),),),

              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings, color: Color(0xFFFEB801),),
                iconSize: 40,
                onPressed: crearFeedsController.mostrarMantenimiento,
              ),

              IconButton(
                icon: Icon(Icons.logout_outlined, color: Color(0xFFFEB801),),
                iconSize: 40,
                onPressed: null,
              )
            ],
          ),


          body:
          SizedBox(
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: <Widget>[
                  Expanded(
                    child:
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                      ),
                      //height: 450,
                      margin: const EdgeInsets.only(left: 16.0,right: 16.0,top: 15.0,bottom: 16.0),
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
                                          image: AssetImage('assets/images/'+ crearFeedsController.imageProfile.value),
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
                                            crearFeedsController.username.value,
                                            style: GoogleFonts.atomicAge(
                                                color: const Color(0xFF3A3434),
                                                fontSize: 18,
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
                                                  margin: const EdgeInsets.only(left: 8.0),
                                                  child: const Icon(
                                                    Icons.add_circle,
                                                    color: Color(0xFF676767),
                                                    size: 18.0,
                                                  )
                                              )
                                            ]
                                        )
                                      ]
                                  ),
                                ),
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

                                      ),
                                      child:
                                      IconButton(
                                        color: Color(0xFF888888),
                                        icon: Icon(Icons.clear),
                                        iconSize: 40,
                                        onPressed: crearFeedsController.descartarMensaje,
                                      ),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),

                          Expanded (
                            child:
                            Container(
                              margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 16.0),

                              child: TextField(
                                controller: crearFeedsController.controllerText,
                                onTap: crearFeedsController.closeEmojiKeyboard,
                                onChanged: (text) {
                                  crearFeedsController.textoIngresado.value = text;
                                  print(crearFeedsController.textoIngresado);
                                },
                                maxLines: 30,
                                maxLength:200,

                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 25),
                                decoration: const InputDecoration.collapsed(
                                    hintText: "¿En que vas a invertir hoy?"
                                ),
                              ),
                            ),
                          ),

                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(25.0),
                                  bottomLeft: Radius.circular(25.0)
                              ),
                              color: Colors.white,
                            ),
                            height: 80,
                            child: Row(
                              children: [

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
                                            child:
                                            Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(25.0)
                                                ),
                                                color: Colors.white,
                                              ),
                                              height: double.infinity,
                                              child:
                                              Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Flexible(
                                                        child: IconButton(
                                                          color: Color(0xFF676767),
                                                          icon: Icon(Icons.tag_faces),
                                                          iconSize: 40,
                                                          onPressed:crearFeedsController.changeStateEmoji,
                                                          ),),
                                                    Flexible(
                                                        child: IconButton(
                                                          color: crearFeedsController.colores[crearFeedsController.colorIconCamara],
                                                          icon: Icon(Icons.photo_library),
                                                          iconSize: 40,
                                                          onPressed: crearFeedsController.mostrarMantenimiento,
                                                        ),),

                                                    Flexible(
                                                        child: IconButton(
                                                          color: crearFeedsController.colores[crearFeedsController.colorIconCamara],
                                                          icon: Icon(Icons.photo_camera),
                                                          iconSize: 40,
                                                          onPressed:  crearFeedsController.mostrarMantenimiento,
                                                        ),),

                                                    Flexible(
                                                        child: IconButton(
                                                          color: Color(0xFF676767),
                                                          icon: Icon(Icons.location_on),
                                                          iconSize: 40,
                                                          onPressed: crearFeedsController.mostrarMantenimiento,
                                                        ),),

                                                    Flexible(
                                                        child: IconButton(
                                                          color: Color(0xFF676767),
                                                          icon: Icon(Icons.attach_file),
                                                          iconSize: 40,
                                                          onPressed: crearFeedsController.mostrarMantenimiento,
                                                        ),),

                                                  ]
                                              ),

                                            ),

                                          ),

                                        ]
                                    ),
                                  ),
                                ),

                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minWidth: 50,
                                    maxWidth: 100,
                                  ),
                                  child:
                                  Container(
                                    margin: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: const Color(0xFFFEB708),
                                    ),

                                    child:
                                    Align(
                                      alignment: Alignment.center,
                                      child:
                                      IconButton(
                                        color: const Color(0xFF3A3434),
                                        icon: const Icon(Icons.send_rounded),
                                        iconSize: 40,
                                        onPressed:
                                          crearFeedsController.createFeed

                                      ),
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
                  Offstage(
                    offstage: !crearFeedsController.emojiShowing.value,
                    child: SizedBox(
                      height: 250,
                      child: EmojiPicker(
                          onEmojiSelected: (Category category, Emoji emoji) {
                            crearFeedsController.onEmojiSelected(emoji);
                          },
                          onBackspacePressed: crearFeedsController.onBackspacePressed,
                          config: Config(
                              columns: 7,
                              // Issue: https://github.com/flutter/flutter/issues/28894
                              emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                              verticalSpacing: 0,
                              horizontalSpacing: 0,
                              initCategory: Category.RECENT,
                              bgColor: const Color(0xFFF2F2F2),
                              indicatorColor: Colors.blue,
                              iconColor: Colors.grey,
                              iconColorSelected: Colors.blue,
                              progressIndicatorColor: Colors.blue,
                              backspaceColor: Colors.blue,
                              showRecentsTab: true,
                              recentsLimit: 28,
                              noRecentsText: 'No Recents',
                              noRecentsStyle: const TextStyle(
                                  fontSize: 20, color: Colors.black26),
                              tabIndicatorAnimDuration: kTabScrollDuration,
                              categoryIcons: const CategoryIcons(),
                              buttonMode: ButtonMode.MATERIAL)),
                    ),
                  ),
                ]
            ),
          ),
        ))
    );
  }



}









