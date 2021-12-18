import 'package:crypto_misiontic_2022/domain/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';

//-----------------------------------Pantalla Feeds-----------------------------------------------------

class HomePage extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return GetX<HomePageController>(
        builder: (homePageController) =>
            Scaffold(
              backgroundColor: const Color(0xFF3A3434),
              appBar: AppBar(
                toolbarHeight: 100,
                automaticallyImplyLeading: false,
                backgroundColor: const Color(0xFF3A3434),
                title: Row(
                  children: <Widget>[
                    Flexible(
                        child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),),
                    const Flexible(
                        child: Text(
                          "Crypto",
                          style: TextStyle(color: Color(0xFFFEB801), fontSize: 30, fontFamily: 'roboto'),),)

                  ],
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.settings, color: Color(0xFFFEB801),),
                    iconSize: 40,
                    onPressed: homePageController.mostrarMantenimiento,
                  ),

                  IconButton(
                    color: Color(0xFFFEB801),
                    icon: Icon(Icons.logout_outlined, color: Color(0xFFFEB801),),
                    iconSize: 40,
                    onPressed: null,
                  ),

                ],
              ),
              body:

              ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: homePageController.mapData.length,
                  itemBuilder: (BuildContext context, int index) {
                  return homePageController.generarFeed(index);

                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              ),



              floatingActionButton:  FloatingActionButton(
                child: const Icon(Icons.add_comment_outlined, color: Color(0xFF3A3434), size: 30,),
                onPressed: homePageController.changeScreenNewMessage,
                backgroundColor: const Color(0xFFFEB801),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

              bottomNavigationBar: AnimatedBottomNavigationBar(
                backgroundColor: const Color(0xFFFEB801),
                icons: const [
                    Icons.forum,
                    Icons.travel_explore,
                    Icons.three_p,
                    Icons.insights,
                ],

                iconSize: 30,
                activeIndex: homePageController.selectedIndex,
                gapLocation: GapLocation.center,
                notchSmoothness: NotchSmoothness.defaultEdge,
                onTap: homePageController.onItemTapped,
              ),



            )
        );


  }


}

