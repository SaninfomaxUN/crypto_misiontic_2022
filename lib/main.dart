import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: Feeds(),
    );
  }
}


//-----------------------------------Pantalla Feeds-----------------------------------------------------
class Feeds extends StatefulWidget {
  Feeds({Key? key}) : super(key: key);

  @override
  _FeedsState createState() {
    return _FeedsState();
  }
}

class _FeedsState extends State<Feeds> {
  String name = "S4N";
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF3A3434),
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF3A3434),
        title: Row(
          children: <Widget>[
            Image.asset('images/logo.png', fit: BoxFit.cover),
            const Text(
                "Crypto",
                style: TextStyle(color: Color(0xFFFEB801), fontSize: 30, fontFamily: 'roboto'),),
          ],
        ),
        actions: <Widget>[
          IconButton(
              color: const Color(0xFFFEB801),
              icon: const Icon(Icons.settings),
              iconSize: 40,
              onPressed: _icnSettings,
          ),

          IconButton(
              color: const Color(0xFFFEB801),
              icon: const Icon(Icons.logout_outlined),
              iconSize: 40,
              onPressed: _icnLogout,
          )
        ],
      ),


      body:

        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return crearFeedIndiv();
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),


/*
        floatingActionButton: Visibility(
          child: FloatingActionButton(onPressed: () {  _icnSettings;},),
          visible: false, // set it to false
        ),*/



      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFFEB801),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
                Icons.add_comment_outlined,
                size: 30,
                color: Color(0xFF3A3434)),
            label: 'Nuevo Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore,
              size: 30,
                color: Color(0xFF3A3434),),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.insights,
                size: 30,
                color: Color(0xFF3A3434)),
            label: 'Stats',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: const Color(0xFF3A3434),
        onTap: _onItemTapped,
      ),




    );
  }

  void changeName(){
    setState(() {
      if(name=="S4N"){
        name = "XD";
      }
    });
  }

//Metodos
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  Container crearFeedIndiv(){
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
          margin: const EdgeInsets.only(left: 8.0,right: 8.0,top: 5.0,bottom: 5.0),
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
                              image: const DecorationImage(
                                image: AssetImage('images/psg.png'),
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
                                "París Saint-Germain",
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
                                          onPressed: _icnLove,
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
                          height: double.infinity,
                          child:
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  color: Colors.red,
                                  icon: const Icon(Icons.favorite),
                                  iconSize: 40,
                                  onPressed: _icnLove,
                                ),
                                IconButton(
                                  color: const Color(0xFF676767),
                                  icon: const Icon(Icons.forward_to_inbox),
                                  iconSize: 40,
                                  onPressed: _icnLove,
                                ),
                                IconButton(
                                  color: const Color(0xFF676767),
                                  icon: const Icon(Icons.share),
                                  iconSize: 40,
                                  onPressed: _icnLove,
                                ),
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                  LimitedBox (
                    maxHeight: 450,
                    child:
                    Image.asset(
                      'images/psgCrypto.jpg',
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
                                const Icon(
                                  Icons.question_answer,
                                  color: Color(0xFF676767),
                                  size: 45,
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

                                  onPressed: _icnLove,
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


  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if(selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => crearFeeds()),
        );
      }if(selectedIndex == 1) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Feeds()),
          );
      }
    });
  }


  //Metodos Iconos
  void _icnSettings() {
    print("settings");
  }
  void _icnLogout() {
    print("logout");
  }
  void _icnLove() {
    print("love");
  }
  void _icnMD() {
    print("MD");
  }
  void _icnsHARE() {
    print("share");
  }

}




//----------------------------Pantala Crear Feeds------------------------------------------------------

class crearFeeds extends StatefulWidget {
  crearFeeds({Key? key}) : super(key: key);

  @override
  _crearFeedsState createState() {
    return _crearFeedsState();
  }
}

class _crearFeedsState extends State<crearFeeds> {

  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF3A3434),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF3A3434),
        title: Row(
          children: <Widget>[
            Image.asset('images/logo.png', fit: BoxFit.cover),
            const Text(
              "Crypto",
              style: TextStyle(color: Color(0xFFFEB801), fontSize: 30, fontFamily: 'roboto'),),
          ],
        ),
        actions: <Widget>[
          IconButton(
            color: const Color(0xFFFEB801),
            icon: const Icon(Icons.settings),
            iconSize: 40,
            onPressed: _icnSettings,
          ),

          IconButton(
            color: const Color(0xFFFEB801),
            icon: const Icon(Icons.logout_outlined),
            iconSize: 40,
            onPressed: _icnLogout,
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
                                      image: const DecorationImage(
                                        image: AssetImage('images/psg.png'),
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
                                          "París Saint - Germain",
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
                                      color: const Color(0xFF888888),
                                      icon: const Icon(Icons.clear),
                                      iconSize: 40,
                                      onPressed: _icnCerrar,
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
                              child: const TextField(
                                maxLines: 30,
                                maxLength:200,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                                decoration: InputDecoration.collapsed(


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
                          height: 100,
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
                                                  IconButton(
                                                    color: const Color(0xFF676767),
                                                    icon: const Icon(Icons.tag_faces),
                                                    iconSize: 40,
                                                    onPressed: _icnEmojis,
                                                  ),
                                                  IconButton(
                                                    color: const Color(0xFF676767),
                                                    icon: const Icon(Icons.photo_library),
                                                    iconSize: 40,
                                                    onPressed: _icnGalery,
                                                  ),
                                                  IconButton(
                                                    color: const Color(0xFF676767),
                                                    icon: const Icon(Icons.photo_camera),
                                                    iconSize: 40,
                                                    onPressed: _icnCamera,
                                                  ),
                                                  IconButton(
                                                    color: const Color(0xFF676767),
                                                    icon: const Icon(Icons.location_on),
                                                    iconSize: 40,
                                                    onPressed: _icnLocation,
                                                  ),
                                                  IconButton(
                                                    color: const Color(0xFF676767),
                                                    icon: const Icon(Icons.attach_file),
                                                    iconSize: 40,
                                                    onPressed: _icnAttach,
                                                  ),
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
                                        onPressed: _icnAttach,
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

            ]
          ),
        ),



    );
  }


  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _icnSettings() {
      print("settings");
    }
  void _icnLogout() {
    print("logout");
  }
  void _icnCerrar() {
    print("cerrar");
    Navigator.pop(context);
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
}














