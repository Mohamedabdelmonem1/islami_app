import 'package:flutter/material.dart';
import 'package:islami_app_route/core/app_colors.dart';
import 'package:islami_app_route/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  int counter = 1;
  int index = 0;
  List<String> tasbeh = [
    'سبحان اللَّه',
    'الحمد للّه',
    'اللَّه أكبر',
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context).textTheme;
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: sebhaClicked,
          child: Container(
            alignment: Alignment.center,
            child: provider.isDark()
                ? Image.asset(
                    "assets/images/body of seb7a.png",
                    width: 230,
                    height: 300,
                    color: AppColors.yellow,
                  )
                : Image.asset(
                    "assets/images/body of seb7a.png",
                    width: 230,
                    height: 300,
                    color: AppColors.primaryLightColor,
                  ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        provider.isDark()
            ? Text(
                "عدد التسبيحات",
                style: theme.bodyMedium?.copyWith(color: AppColors.whiteColor),
                textAlign: TextAlign.center,
              )
            : Text(
                "عدد التسبيحات",
                style: theme.bodyMedium,
                textAlign: TextAlign.center,
              ),
        const SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          height: 81,
          width: 69,
          decoration: BoxDecoration(
            color: provider.isDark()
                ? AppColors.darkColor
                : AppColors.primaryLightColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '$counter',
            style: theme.bodySmall,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          height: 51,
          width: 137,
          decoration: BoxDecoration(
            color: provider.isDark()
                ? AppColors.yellow
                : AppColors.primaryLightColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: provider.isDark()
              ? Text(
                  tasbeh[index],
                  style: theme.bodySmall?.copyWith(color: AppColors.blackColor),
                )
              : Text(
                  tasbeh[index],
                  style: theme.bodySmall?.copyWith(color: AppColors.whiteColor),
                ),
        ),
      ],
    );
  }

  void sebhaClicked() {
    counter++;
    if (counter == 31) {
      counter = 1;
      index++;
    }
    if (index == tasbeh.length) {
      index = 0;
    }
    setState(() {});
  }
}
