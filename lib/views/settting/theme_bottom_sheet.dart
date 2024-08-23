import 'package:flutter/material.dart';
import 'package:islami_app_route/provider/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.isDark() // false
                ? getUnselectedItem(AppLocalizations.of(context)!.light)
                : getSelectedItem(AppLocalizations.of(context)!.light),
          ),
          const SizedBox(height: 8.0),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.isDark() // false
                ? getSelectedItem(AppLocalizations.of(context)!.dark)
                : getUnselectedItem(AppLocalizations.of(context)!.dark),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String title) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).canvasColor),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).canvasColor,
          )
        ],
      ),
    );
  }

  Widget getUnselectedItem(String title) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
