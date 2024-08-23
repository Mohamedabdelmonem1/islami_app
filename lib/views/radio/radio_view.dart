import 'package:flutter/material.dart';
import 'package:islami_app_route/core/app_colors.dart';
import 'package:islami_app_route/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        const Image(
          width: 412,
          height: 200,
          image: AssetImage('assets/images/radio_screen.png'),
        ),
        const SizedBox(
          height: 45,
        ),
        Text(
          "أذاعه القران الكريم",
          style: provider.isDark()
              ? Theme.of(context).textTheme.bodyMedium
              : Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 45,
        ),
        SizedBox(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              provider.isDark()
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_previous,
                        size: 40,
                        color: AppColors.yellow,
                      ))
                  : const Icon(
                      Icons.skip_previous,
                      size: 40,
                      color: AppColors.primaryLightColor,
                    ),
              provider.isDark()
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 40,
                        color: AppColors.yellow,
                      ))
                  : const Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: AppColors.primaryLightColor,
                    ),
              provider.isDark()
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_next,
                        size: 40,
                        color: AppColors.yellow,
                      ))
                  : const Icon(
                      Icons.skip_next,
                      size: 40,
                      color: AppColors.primaryLightColor,
                    ),
            ],
          ),
        )
      ],
    );
  }
}
