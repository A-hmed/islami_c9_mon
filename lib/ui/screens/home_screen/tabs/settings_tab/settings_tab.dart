import 'package:flutter/material.dart';
import 'package:islami_c9_mon/providers/settings_provider.dart';
import 'package:islami_c9_mon/ui/utils/app_colors.dart';
import 'package:islami_c9_mon/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool arSwitchValue = false;

  bool darkModeSwitchValue = false;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of(context,);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text("Settings", style: AppTheme.settingsTitleTextStyle, ),
          SizedBox(height: 12,),
          Row(
            children: [
              Text("Enable arabic(العربيه)", style: AppTheme.settingsOptionTextStyle,),
              Spacer(),
              Switch(value: arSwitchValue, onChanged: (newValue){
                arSwitchValue = newValue;
                if(arSwitchValue){
                  settingsProvider.setCurrentLocale("ar");
                }else {
                  settingsProvider.setCurrentLocale("en");
                }
              }, activeColor: AppColors.primiary,)
            ],
          ),
          Row(
            children: [
              Text("Dark mode",  style: AppTheme.settingsOptionTextStyle),
              Spacer(),
              Switch(value: darkModeSwitchValue, onChanged: (newValue){
                darkModeSwitchValue = newValue;
                if(darkModeSwitchValue){
                  settingsProvider.setCurrentMode(ThemeMode.dark);
                }else {
                  settingsProvider.setCurrentMode(ThemeMode.light);
                }
              }, activeColor: AppColors.primiary)
            ],
          )
        ],
      ),
    );
  }
}
