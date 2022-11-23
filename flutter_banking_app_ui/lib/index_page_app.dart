import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app_ui/pages/dashboard_page.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'my_theme/color.dart';

/// 底部菜单栏
class IndexPageApp extends StatefulWidget {
  const IndexPageApp({Key? key}) : super(key: key);

  @override
  State<IndexPageApp> createState() => _IndexPageAppState();
}

class _IndexPageAppState extends State<IndexPageApp> {

  int pageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        bottomNavigationBar: getFooter(),
        body: getBody(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              selectedTab(4);
            },
            backgroundColor: primary,
            child: const Icon(
              AntDesign.creditcard,
              size: 25,
            )
          //params
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked);
  }


  ///
  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        // 首页
        DashbaordPage(),
        Center(
          child: Text("Chat Page",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Notification Page",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Account Page",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Card Page",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
      ],
    );
  }


  ///
  Widget getFooter() {
    List<IconData> iconItems = [
      MaterialCommunityIcons.view_grid,
      MaterialCommunityIcons.comment,
      MaterialCommunityIcons.bell,
      MaterialCommunityIcons.account_circle,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }


  ///
  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
