import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_route/core/app_colors.dart';
import 'package:islami_app_route/provider/settings_provider.dart';
import 'package:islami_app_route/views/quran/sura_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraData;
    if (content.isEmpty) loadData(args.suraNumber);
    var provider = Provider.of<SettingsProvider>(context);

    return SafeArea(
      child: Stack(
        children: [
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
                style: provider.isDark()
                    ? Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: AppColors.whiteColor)
                    : Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: provider.isDark()
                      ? AppColors.darkColor
                      : Color(0xfff8f8f8f8).withOpacity(.85),
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.only(
                  top: 20, right: 30, left: 30, bottom: 60),
              padding: const EdgeInsets.only(
                  top: 20, right: 30, left: 30, bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "سورة ${args.suraName}",
                        style: provider.isDark()
                            ? Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.yellow)
                            : Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      provider.isDark()
                          ? const Icon(
                              Icons.play_circle_fill_outlined,
                              color: AppColors.yellow,
                            )
                          : const Icon(Icons.play_circle_fill_outlined),
                    ],
                  ),
                  Divider(
                    color: provider.isDark()
                        ? AppColors.yellow
                        : AppColors.primaryLightColor,
                    thickness: 1.8,
                  ),
                  content.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryLightColor,
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: versesList.length,
                            itemBuilder: (context, index) {
                              return Text("${versesList[index]}(${index + 1})",
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: provider.isDark()
                                      ? Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: AppColors.yellow,
                                              fontSize: 22)
                                      : Theme.of(context).textTheme.bodySmall);
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String content = '';
  List<String> versesList = [];

  loadData(String suraNumber) async {
    content = await rootBundle.loadString("assets/files/$suraNumber.txt");
    versesList = content.split("\n");
    setState(() {});
    return content;
  }
}
