import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crypto_misiontic_2022/ui/pages/authentication/login.dart';

class resetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF000000),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 150,
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
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                    hintText: 'Introduce tu correo electrónico',
                    hintStyle: TextStyle(color: Color(0xFF979797)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
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
