import 'package:flutter/material.dart';
import '../../model/MenuModal.dart';
import 'widget/MyDrawer.dart';

class DashboardTablet extends StatefulWidget {
  int mainPage ;
  Function (MenuModal item)  hanlde ;
  Widget child ;

  DashboardTablet({super.key , required this.mainPage , required this.hanlde , required this.child});
  @override
  State<DashboardTablet> createState() => _DashboardTabletState();
}

class _DashboardTabletState extends State<DashboardTablet> {

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
