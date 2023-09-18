import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_c9_mon/providers/settings_provider.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/home_screen.dart';
import 'package:islami_c9_mon/ui/screens/sura_details_screen/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c9_mon/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => SettingsProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider settingsProvider ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of(context);

    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(settingsProvider.currentLocale),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.mode,
      routes: {
        HomeScreen.routeName:(_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
