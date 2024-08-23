import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_route/provider/settings_provider.dart';
import 'package:islami_app_route/views/settting/language_bottom_sheet.dart';
import 'package:islami_app_route/views/settting/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.theme_title,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: theme.canvasColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDark()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: theme.textTheme.bodySmall,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: theme.canvasColor,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            AppLocalizations.of(context)!.language_title,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: theme.canvasColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.currentLocal == "en" ? "English" : "عربي",
                    style: theme.textTheme.bodySmall,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: theme.canvasColor,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ThemeBottomSheet();
        });
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }
}
