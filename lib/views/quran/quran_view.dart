import 'package:flutter/material.dart';
import 'package:islami_app_route/core/app_colors.dart';
import 'package:islami_app_route/provider/settings_provider.dart';
import 'package:islami_app_route/views/quran/item_sura_widget.dart';
import 'package:islami_app_route/views/quran/sura_data.dart';
import 'package:provider/provider.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: Image.asset("assets/images/quran_header_icn.png")),
        Divider(
          color: provider.isDark()
              ? AppColors.yellow
              : AppColors.primaryLightColor,
          thickness: 3,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "رقم السورة",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              height: 40,
              child: VerticalDivider(
                color: provider.isDark()
                    ? AppColors.yellow
                    : AppColors.primaryLightColor,
                thickness: 2,
              ),
            ),
            Expanded(
              child: Text(
                "أسم السورة",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
        Divider(
          color: provider.isDark()
              ? AppColors.yellow
              : AppColors.primaryLightColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: suraNames.length,
            itemBuilder: (context, index) {
              return ItemSuraWidget(
                suraData: SuraData(
                    suraName: suraNames[index],
                    suraNumber: (index + 1).toString()),
              );
            },
          ),
        ),
      ],
    );
  }

  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس",
  ];
}
