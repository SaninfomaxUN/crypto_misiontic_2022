import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:crypto_misiontic_2022/domain/controllers/auth_controller.dart';
import 'package:crypto_misiontic_2022/ui/firebase_central.dart';

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyBgxIopH3kmXebbl4ncugoNmoJsGnHc3pg",
          authDomain: "mensajeria.firebaseapp.com",
          appId: "1:1028527409648:android:ee3319668f2315e9ea3535",
          messagingSenderId: "messagingSenderId",
          projectId: "mensajeria-1020e",
          databaseURL: "https://misiontic-crypto-default-rtdb.firebaseio.com/"
      ));

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cryptocurrency',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            logError("error ${snapshot.error}");
            return const Wrong();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Get.put(AuthenticationController());
            return const FirebaseCentral();
          }
          return const Loading();
        },
      )),
    );
  }
}

class Wrong extends StatelessWidget {
  const Wrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Ocurrio un error!"));
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
