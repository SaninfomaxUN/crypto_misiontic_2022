import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loggy/loggy.dart';
import 'package:login_signup_auth/domain/controller/auth_controller.dart';
import 'package:login_signup_auth/ui/pages/authentication/reset_password.dart';
import 'package:login_signup_auth/ui/pages/authentication/signUp.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
    final _auth = FirebaseAuth.instance;
  AuthenticationController authCtrl = Get.find();
  String? errorMessage;

  _login(theEmail, thePassword) async {
    logInfo('Autenticacion de $theEmail $thePassword');
    try {
      await authCtrl.login(theEmail, thePassword);
    } catch (err) {
      Get.snackbar(
        "Inicio de Sesión",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 120),
                        Text(
                          "Cryptocurrency",
                          style: GoogleFonts.marcellusSc(
                            fontSize: 47,
                            color: const Color(0xFFFEB801),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Inicio de Sesión',
                              style: GoogleFonts.marcellusSc(
                                color: Colors.white,
                                fontSize: 35,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Registrarse',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 1,
                                  color: Color(0xFFFEB801),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: controllerEmail,
                          decoration: InputDecoration(
                              labelText: "Correo electrónico",
                              labelStyle: GoogleFonts.poppins(
                                  color: const Color(0xFF979797)),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              ))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Ingresa un correo electrónico";
                            } else if (!value.contains('@')) {
                              return "Ingresa un correo electrónico válido";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          controller: controllerPassword,
                          decoration: InputDecoration(
                            labelText: "Contraseña",
                            labelStyle: GoogleFonts.poppins(
                              color: const Color(0xFF979797),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Ingresa una contraseña";
                            } else if (value.length < 6) {
                              return "La contraseña debe tener al menos 6 caracteres";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          color: const Color(0xFFFEB801),
                          child: Text("Iniciar sesión", style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),),
                          height: MediaQuery.of(context).size.height * 0.08,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onPressed: (){
                            signIn(controllerEmail.text, controllerPassword.text);
                          }
                          ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => resetPassword()));
                          },
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style: GoogleFonts.poppins(
                              color: Color(0xFFFEB801),
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              decorationThickness: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]
                )
                )
                );
  }
    void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage())),
                });
      }on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      } 
}
}
}