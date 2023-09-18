import 'package:flutter/material.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/quran_tab/quran_tab.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/radio_tab/radio_tab.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_c9_mon/ui/utils/app_assets.dart';
import 'package:islami_c9_mon/ui/utils/app_colors.dart';
import 'package:islami_c9_mon/ui/utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.background))),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: const Text(
            "Islami",
            style: AppTheme.appBarTextStyle,
          ),
        ),
        body: tabs[currentTabIndex],
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: buildBottomNavigation(context),
      ),
    );
  }

  Widget buildBottomNavigation(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColors.primiary),
        child: BottomNavigationBar(
            onTap: (index) {
              currentTabIndex = index;
              setState(() {});
            },
            currentIndex: currentTabIndex,
            iconSize: 32,
            selectedItemColor: AppColors.accent,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppAssets.icQuran)),
                  label: "Quran"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),
                  label: "Ahadeth"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppAssets.icSebha)),
                  label: "Sebha"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppAssets.icRadio)),
                  label: "Radio"),
            ]),
      );
}
