import 'package:flutter/material.dart';
import 'package:islami_c9_mon/providers/settings_provider.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/quran_tab/quran_tab.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/radio_tab/radio_tab.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/settings_tab/settings_tab.dart';
import 'package:islami_c9_mon/ui/utils/app_assets.dart';
import 'package:islami_c9_mon/ui/utils/app_colors.dart';
import 'package:islami_c9_mon/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SettingsProvider settingsProvider;
  int currentTabIndex = 0;
  List<Widget> tabs = [
    const QuranTab(),
    AhadethTab(),
    const SebhaTab(),
    const RadioTab(),
    SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(settingsProvider.isDarkEnabled() ?
          AppAssets.backgroundDark: AppAssets.background))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami,),
        ),
        body: tabs[currentTabIndex],
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: buildBottomNavigation(context),
      ),
    );
  }

  Widget buildBottomNavigation(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(canvasColor:settingsProvider.isDarkEnabled()?
            AppColors.primiaryDark: AppColors.primiary),
        child: BottomNavigationBar(
            onTap: (index) {
              currentTabIndex = index;
              setState(() {});
            },
            currentIndex: currentTabIndex,
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AppAssets.icQuran)),
                  label: AppLocalizations.of(context)!.quran),
              const BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),
                  label: "Ahadeth"),
              const BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppAssets.icSebha)),
                  label: "Sebha"),
              const BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppAssets.icRadio)),
                  label: "Radio"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings")
            ]),
      );
}
