import 'package:flutter/material.dart';
import 'package:islami_c9_mon/model/sura_details_args.dart';
import 'package:islami_c9_mon/ui/screens/sura_details_screen/sura_details_screen.dart';
import 'package:islami_c9_mon/ui/utils/app_assets.dart';
import 'package:islami_c9_mon/ui/utils/app_colors.dart';

import '../../../../utils/app_theme.dart';

class AhadethTab extends StatelessWidget {
  List<String> ahadethNames = List.generate(50, (index) => "${index + 1}الحديث رقم ");

  @override
  Widget build(BuildContext context) {

    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 30,
                child: Image.asset(AppAssets.ahadethTabLogo)),
            const Divider(
              color: AppColors.primiary,
              thickness: 4,
            ),
            const Text("Ahadeth name",textAlign: TextAlign.center, style: AppTheme.suraNameTextStyle,),

            const Divider(
              color: AppColors.primiary,
              thickness: 4,
            ),
            buildSuraNamesList()
          ],
        ));
  }

  buildSuraNamesList() {
    return Expanded(
        flex: 70,
        child: ListView.separated(
          itemCount: ahadethNames.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                    arguments: SuraDetailsArgs(
                        suraName: ahadethNames[index],
                        fileName: "h${index+1}.txt",
                        isQuranFile: false));
              },
              child: Text(ahadethNames[index],
                textAlign: TextAlign.center,
                style: AppTheme.suraNameTextStyle
                    .copyWith(fontWeight: FontWeight.w400),),
            );
          },
          separatorBuilder: (_, __){
            return const Divider(
              color: AppColors.primiary,
              thickness: 4,
            );
          },
        ));
  }
}
