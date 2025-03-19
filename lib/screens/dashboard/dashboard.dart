import 'package:flutter/material.dart';
import 'package:gk/model/MenuModal.dart';
import 'package:gk/screens/dashboard/page/product.dart';

import '../../util/responsive.dart';
import 'dashboard_desktop.dart';
import 'dashboard_mobile.dart';
import 'dashboard_tablet.dart';
import 'page/history.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int mainPage = 1 ;
  Widget getPage(bool isMobile) {
    if(mainPage == 6) {
      return Container() ;
    }
    else if(mainPage == 2) {
      return Product() ;
    }
    else if (mainPage == 4) {
      return Container() ;
    }else if(mainPage ==3){
      return History();
    }
    return Container() ;
  }

  @override
  Widget build(BuildContext context) {

    void handle(MenuModal item) {
      setState(() {
        mainPage = item.id;
      });
    }

    return Responsive(
        desktop: DashboardDesktop(
          mainPage: mainPage,
          hanlde: (item) {
            handle(item);
          },
          child: getPage(false),
        ),
        mobile: DashboardMobile(
          mainPage: mainPage,
          hanlde: (item) {
            handle(item);
          },
          child: getPage(true),
        ),
        tablet: DashboardTablet(
          mainPage: mainPage,
          hanlde: (item) {
            handle(item);
          },
          child: getPage(false),
        )
    );
  }
}
