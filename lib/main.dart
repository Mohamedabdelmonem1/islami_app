import 'package:flutter/material.dart';
import 'package:islami_app_route/core/my_theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_route/views/hadeth/hadeth_details.dart';
import 'package:islami_app_route/provider/settings_provider.dart';
import 'package:islami_app_route/views/home_view.dart';
import 'package:islami_app_route/views/quran/sura_details.dart';
import 'package:islami_app_route/views/splash_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: settingsProvider.currentTheme,
      locale: Locale(settingsProvider.currentLocal),
      initialRoute: "/",
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeView.routeName: (context) => const HomeView(),
        SuraDetails.routeName: (context) => const SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
    );
  }
}
