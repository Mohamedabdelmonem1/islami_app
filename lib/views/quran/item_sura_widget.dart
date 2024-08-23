import 'package:flutter/material.dart';
import 'package:islami_app_route/core/app_colors.dart';
import 'package:islami_app_route/views/quran/sura_data.dart';
import 'package:islami_app_route/views/quran/sura_details.dart';

class ItemSuraWidget extends StatelessWidget {
  final SuraData suraData;

  const ItemSuraWidget({super.key, required this.suraData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetails.routeName,
          arguments: SuraData(
              suraName: suraData.suraName, suraNumber: suraData.suraNumber),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              suraData.suraNumber,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(
            height: 40,
            child: VerticalDivider(
              color: AppColors.primaryLightColor,
              thickness: 2,
            ),
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              suraData.suraName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
