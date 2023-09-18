import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c9_mon/model/sura_details_args.dart';
import 'package:islami_c9_mon/ui/utils/app_assets.dart';
import 'package:islami_c9_mon/ui/utils/app_colors.dart';
import 'package:islami_c9_mon/ui/utils/app_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const routeName = "sura_details";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String fileContent = "";
  late SuraDetailsArgs args;


  @override
  Widget build(BuildContext context) {
   args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;

    if(fileContent.isEmpty) readFile();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.background))),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: Text(
            args.suraName,
            style: AppTheme.appBarTextStyle,
          ),
        ),
        body: fileContent.isNotEmpty ?
         Container(
           margin: EdgeInsets.all(24),
           height: MediaQuery.of(context).size.height * .8,
           decoration: BoxDecoration(
             color: AppColors.white,
             borderRadius: BorderRadius.circular(24)
           ),
           width: double.infinity,
           child: SingleChildScrollView(
             child: Text(fileContent,
               textDirection: TextDirection.rtl,
               textAlign: TextAlign.center,
               style: const TextStyle(fontSize: 24,
                   fontWeight: FontWeight.w400, color: AppColors.accent),),
           ),
         ) :
          const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void readFile() async {
    fileContent = await rootBundle.loadString("assets/files/${args.isQuranFile
        ? "quran" : "ahadeth"}/${args.fileName}");
    List<String> fileLines = fileContent.split("\n");
    for(int i = 0; i < fileLines.length; i++){
      fileLines[i] += args.isQuranFile ? " (${i+1}) ": "";
    }
    fileContent = fileLines.join("");
    setState(() {});
  }
}
