import 'package:flutter/material.dart';
import 'package:islami_app_route/provider/settings_provider.dart';
import 'package:islami_app_route/views/hadeth/hadeth_view.dart';
import 'package:islami_app_route/views/quran/quran_view.dart';
import 'package:islami_app_route/views/radio/radio_view.dart';
import 'package:islami_app_route/views/sebha/sebha_view.dart';
import 'package:islami_app_route/views/settting/setting_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String routeName = "homeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  List<Widget> screens = [
    QuranView(),
    HadethView(),
    SebhaView(),
    RadioView(),
    SettingView(),
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return SafeArea(
      child: Stack(children: [
        provider.isDark()
            ? Image.asset(
                "assets/images/main_background_dark.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset("assets/images/main_background.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage("assets/images/icon_quran.png")),
                  label: AppLocalizations.of(context)!.quran_title,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage("assets/images/icon_hadeth.png")),
                  label: AppLocalizations.of(context)!.hadeth_title,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage("assets/images/icon_sebha.png")),
                  label: AppLocalizations.of(context)!.tasbeh_title,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage("assets/images/icon_radio.png")),
                  label: AppLocalizations.of(context)!.radio_title,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings_title,
                ),
              ],
            ),
          ),
          body: screens[selectedIndex],
        ),
      ]),
    );
  }
}
