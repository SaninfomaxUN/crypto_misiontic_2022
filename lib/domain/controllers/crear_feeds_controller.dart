import 'package:crypto_misiontic_2022/ui/pages/crear_feeds.dart';
import 'package:crypto_misiontic_2022/ui/pages/home_page.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crypto_misiontic_2022/domain/controllers/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class CrearFeedsController extends GetxController{
  final TextEditingController controllerText = TextEditingController();
  HomePageController homePageController = Get.find();
  RxString username =  "París Saint - Germain".obs;
  RxString imageProfile = "psg.png".obs;
  RxString textFeed = "".obs;
  RxString imageFeed = "psgCrypto3.jpg".obs;


//----Get Text for Emojis
  RxString textoIngresado="".obs;
  //Emojis Keyboard
  RxBool emojiShowing = false.obs;



  onEmojiSelected(Emoji emoji) {
    controllerText
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: controllerText.text.length));
    textoIngresado.value = controllerText.text;
  }

  onBackspacePressed() {
    controllerText
      ..text = controllerText.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: controllerText.text.length));
  }

  Future<void> changeStateEmoji() async {
    FocusManager.instance.primaryFocus?.unfocus();
    await Future.delayed(const Duration(milliseconds: 150));
    emojiShowing.value = !emojiShowing.value;
    print(emojiShowing.value);
    if(emojiShowing.value){

    }
    update();
  }
  void closeEmojiKeyboard(){
        emojiShowing.value = false;
        update();
  }
  void closeAllKeyboards(){
    FocusManager.instance.primaryFocus?.unfocus();
    emojiShowing.value=false;
    update();
  }


  //Colors for selected icons
  List<Color> colores = <Color>[
    const Color(0xFF676767),
    Colors.lightGreenAccent,
  ];


  //Image Selector
  final ImagePicker _picker = ImagePicker();
  int colorIconCamara = 0;
  int colorIconGallery = 0;



  //-- Capture a photo
  void getFromCamera() async {
    final XFile? photo = (await _picker.pickImage(source: ImageSource.camera));
    colorIconCamara = 1;
    update();
  }

  //-- Capture from gallery
  void getFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    colorIconGallery = 1;
    update();
  }

  void createFeed(){

    homePageController.mapData[homePageController.mapData.length]= {"username":"París Saint - Germain","imageProfile":"psg.png","textFeed":textoIngresado.value,"imageFeed":
    "psgCrypto3.jpg"};
    Get.to(() => HomePage(),transition: Transition.leftToRight);
    controllerText.text = "";
    textoIngresado.value="";
    homePageController.update();

    AudioCache player = AudioCache();
    const alarmAudioPath = "sounds/soundSuccess.mp3";
    player.play(alarmAudioPath);

    Get.defaultDialog(
      title: "",
      content:  const Icon(Icons.task_alt,color: Colors.white,size: 50,),
      backgroundColor: Colors.green,
    );
    Future.delayed(const Duration(seconds: 2),(){
      Get.back();
    });
    closeAllKeyboards();

  }

  void descartarMensaje(){
    Get.dialog(
      AlertDialog(
        title: const Text('Desea descartar la publicación?'),
        actions: <Widget>[
          TextButton(
            onPressed: Get.back,
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: descartar,
            child: const Text('OK'),
          ),
        ],
      ),
//        barrierDismissible: false,
    );
  }

  void descartar(){
    controllerText.text = "";
    //Get.back();
    Get.to(() => HomePage(),transition: Transition.leftToRight);
  }

  void _icnSettings() {
    print("settings");
  }
  void _icnLogout() {
    print("logout");
  }


  void _icnEmojis() {
    print("emoji");
  }

  void _icnGalery() {
    print("Galery");
  }

  void _icnCamera() {
    print("Camera");
  }

  void _icnLocation() {
    print("Location");
  }

  void _icnAttach() {
    print("Attach file");
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




}