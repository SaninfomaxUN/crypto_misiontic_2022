// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup_auth/domain/controller/auth_controller.dart';
import 'package:login_signup_auth/ui/pages/authentication/login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _signUpScreenState createState() => _signUpScreenState();
}

class _signUpScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  AuthenticationController authCtrl = Get.find();

  _signup(theEmail, thePassword) async {
    try {
      await authCtrl.signUp(theEmail, thePassword);
      Get.snackbar(
        "Registrar Usuario",
        'Usuario registrado exitosamente!',
        icon: const Icon(Icons.person_add, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (err) {
      Get.snackbar(
        "Registrar Usuario",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   foregroundColor: Color(0xFF000000),
      //   backgroundColor: Color(0xFFFEB801),
      // ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "Cryptocurrency",
                    style: GoogleFonts.marcellusSc(
                      fontSize: 44,
                      color: Color(0xFFFEB801),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        '¿Ya tienes una cuenta?',
                        style: GoogleFonts.marcellusSc(
                            color: Colors.white, fontSize: 22),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInScreen()));
                        },
                        child: const Text(
                          '¡Inicia Sesión!',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 1,
                            color: Color(0xFFFEB801),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                TextFormField(
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.name,
                  controller: controllerName,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.poppins(
                        color: const Color(0xFF979797), fontSize: 18),
                    hintText: "Ingresa tu nombre",
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                TextFormField(
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: controllerEmail,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.poppins(
                        color: const Color(0xFF979797), fontSize: 18),
                    hintText: "Ingresa tu correo electrónico",
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ingresa un correo electrónico";
                    } else if (!value.contains('@')) {
                      return "Ingresa un correo electrónico válido";
                    }
                  }, 
                ),
                const SizedBox(
                  height: 17,
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: controllerPassword,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.poppins(
                        color: const Color(0xFF979797), fontSize: 18),
                    hintText: "Contraseña",
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
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
                  height: 17,
                ),
                ButtonTheme(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: 
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  color: const Color(0xFFFEB801),
                  child: Text(
                    "Registrarse",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    ),
                    
                  onPressed: () {
                    final form = _formKey.currentState;
                    form!.save();
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (_formKey.currentState!.validate()) {
                      _signup(controllerEmail.text, controllerPassword.text);
                    }
                  },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  }