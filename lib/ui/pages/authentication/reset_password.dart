import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup_auth/ui/pages/authentication/login.dart';

class resetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<resetPassword>{
  late String _email;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF000000),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 140,
            ),
            Text(
              'Recuperación de \ncontraseña',
              style: GoogleFonts.marcellusSc(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Introduce tu correo electrónico',
                    hintStyle: TextStyle(color: Color(0xFF979797)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                        )
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value.trim();
                          });
                        },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Enviaremos un mensaje a tu correo \npara que restablezcas tu contraseña',
              style: GoogleFonts.marcellusSc(
                fontWeight: FontWeight.w600,
                color: Colors.white60,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {
                  auth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogInScreen(),
                      ));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFFFEB801)),
                  child: Text(
                    "Enviar mensaje",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                )),
          ]),
        ));
  }
}
