import 'package:crypto_misiontic_2022/ui/pages/authentication/login.dart';
import 'package:crypto_misiontic_2022/ui/pages/crear_feeds.dart';
import 'package:crypto_misiontic_2022/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'ui/my_app.dart';
import 'package:crypto_misiontic_2022/domain/controllers/home_page_controller.dart';
import 'package:crypto_misiontic_2022/domain/controllers/crear_feeds_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  Get.put(HomePageController());
  Get.put(CrearFeedsController());
  Get.put(const LogInScreen());
  runApp(MyApp());
}
/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: /*const LogInScreen()*/HomePage(),
    );
  }
}*/







