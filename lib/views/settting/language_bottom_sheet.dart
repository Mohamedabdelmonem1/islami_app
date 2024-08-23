import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/settings_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
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
              provider.changeLanguage("en");
            },
            child: provider.currentLocal == "en"
                ? getSelectedItem("English")
                : getUnselectedItem("English"),
          ),
          const SizedBox(height: 8.0),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },
            child: provider.currentLocal == "en"
                ? getUnselectedItem("عربي")
                : getSelectedItem("عربي"),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String title) {
    return Container(
      padding: EdgeInsets.all(8.0),
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
      padding: EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
