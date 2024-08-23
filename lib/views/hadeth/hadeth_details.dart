import 'package:flutter/material.dart';
import 'package:islami_app_route/core/app_colors.dart';
import 'package:islami_app_route/views/hadeth/hadeth_data_class.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../provider/settings_provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "hadeth-details";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethDataClass;
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
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.hadeth_title,
                style: provider.isDark()
                    ? Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.whiteColor)
                    : Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColors.blackColor),
              ),
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 65),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          args.title,
                          style: provider.isDark()
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.yellow)
                              : Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Divider(
                            thickness: 1.2,
                            color: Theme.of(context).canvasColor,
                          ),
                        ),
                        Text(
                          args.content,
                          textDirection: TextDirection.rtl,
                          style: provider.isDark()
                              ? Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.yellow)
                              : Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
