import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_route/core/app_colors.dart';
import 'package:islami_app_route/provider/settings_provider.dart';
import 'package:islami_app_route/views/hadeth/hadeth_data_class.dart';
import 'package:islami_app_route/views/hadeth/hadeth_details.dart';
import 'package:islami_app_route/views/hadeth/hadeth_title_widget.dart';
import 'package:provider/provider.dart';

class HadethView extends StatefulWidget {
  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  List<HadethDataClass> allHadeth = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    if (allHadeth.isEmpty) loadHadethFile();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/hadeth_header.png"),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, HadethDetails.routeName,
                    arguments: allHadeth[index]);
              },
              child: HadethTitleWidget(
                allHadeth[index].title,
              ),
            ),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Divider(
                color: provider.isDark()
                    ? AppColors.yellow
                    : AppColors.primaryLightColor,
                thickness: 1.2,
              ),
            ),
            itemCount: allHadeth.length,
          ),
        ),
      ],
    );
  }

  void loadHadethFile() async {
    List<HadethDataClass> list = [];
    String content = await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> allHadethContent = content.split("#");

    for (int i = 0; i < allHadethContent.length; i++) {
      String singleHadethContent = allHadethContent[i].trim();

      int indexOfFirtLine = singleHadethContent.indexOf("\n");
      String title = singleHadethContent.substring(0, indexOfFirtLine);
      String content = singleHadethContent.substring(indexOfFirtLine + 1);

      HadethDataClass hadeth = HadethDataClass(title, content);
      list.add(hadeth);
    }
    allHadeth = list;
    setState(() {});
  }
}
