import 'package:flutter/material.dart';
import 'package:gk/theme/theme.dart';

import '../../../data/SideMenuData.dart';
import '../../../model/MenuModal.dart';
import 'dark_light_mode.dart';
import 'side_menu_widget.dart';

class Mydrawer extends StatefulWidget {

  int selection ;
  final Function (MenuModal item) handle ;

  Mydrawer({super.key , required this.selection , required this.handle});

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {

  @override
  Widget build(BuildContext context) {
    Color main_color = Theme.of(context).colorScheme.mainColor ;


    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.mainCard,
      elevation: 8.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight:Radius.circular(8),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(8)
          )
      ),
      shadowColor: Theme.of(context).colorScheme.shadow,
      child: Column(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.8,
                child: ListView(
                  children: [
                    Container(
                      height: 100,
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_outlined,
                            size: 30,
                            color: main_color,

                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15 ,left: 15),
                            child: Text(
                              "Project one",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,

                                  color: main_color
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: listmenu
                          .map((item) => SideMenuWidget(
                        item: item,
                        isSelected: widget.selection,
                        ontap: () {
                          setState(() {
                            widget.selection = item.id;
                            widget.handle(item);
                          });
                        },
                      )).toList(),
                    )
                  ],
                ),

              ),
              Container(
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const DarkLightMode() ,
                          Container(
                            margin: EdgeInsets.all(10),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {

                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(13),
                                      child: Icon(
                                        Icons.logout,
                                        color: Theme.of(context).colorScheme.maintext,
                                      ),
                                    ),
                                    Text(
                                      "Log out",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context).colorScheme.maintext
                                      ),

                                    )

                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}