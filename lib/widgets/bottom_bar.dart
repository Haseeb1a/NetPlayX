
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:netflix/controller/bottom_controller.dart';
import 'package:netflix/helpers/colors.dart';
import 'package:netflix/view/downloads/downloads.dart';
import 'package:netflix/view/home_page/home_page.dart';
import 'package:netflix/view/hot_and_new/main_views.dart';
import 'package:netflix/view/search/searched.dart';
import 'package:netflix/view/shors/shorts.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  // int _currentIndex = 0;

  final List<Widget> bottomBarBarPages = [
    const Home(),
    const HotView(),
    const ShortLIstpage(),
    Download(),
     
    const SearchScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final bottombarControlldata = Provider.of<BottomController>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors().darktheme,
        body: bottomBarBarPages[bottombarControlldata.currentIndex],
        bottomNavigationBar: FloatingNavbar(

            // iconSize: 30,
            // itemBorderRadius: 10,
            selectedBackgroundColor: AppColors().darktheme,
            backgroundColor: Color.fromARGB(255, 27, 27, 27),
            onTap: (int val) {
              bottombarControlldata.changer(val);
              // setState(() {
              //   _currentIndex = val;
              // });
            },
            currentIndex: bottombarControlldata.currentIndex,
            elevation: 10,
            selectedItemColor: AppColors().primarytheme,
            unselectedItemColor: AppColors().whitetheme,
            items: [
              FloatingNavbarItem(icon: Icons.movie, title: 'Home'),
              FloatingNavbarItem(
                icon: Icons.movie_filter,
                title: 'views',
              ),
              FloatingNavbarItem(
                icon: Icons.video_library_rounded,
                title: 'Shorts',
              ),
              FloatingNavbarItem(icon: Icons.download, title: 'Downloads'),
              FloatingNavbarItem(icon: Icons.search, title: 'search'),
            ]),
      ),
    );
  }
}
