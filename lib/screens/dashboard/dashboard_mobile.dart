import 'package:flutter/material.dart';

import '../../model/MenuModal.dart';
import 'widget/MyDrawer.dart';

class DashboardMobile extends StatefulWidget {

  int mainPage ;
  Function (MenuModal item)  hanlde ;
  Widget child ;

  DashboardMobile({super.key , required this.mainPage , required this.hanlde , required this.child});

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        drawer: Mydrawer(
          selection: widget.mainPage,
          handle: (item) {
            Navigator.pop(context) ;
            widget.hanlde(item) ;
          },
        ),
        body: widget.child
    );
  }
}
