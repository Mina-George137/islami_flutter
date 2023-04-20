import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_flutter/home/quran/sura_name.dart';
import 'package:islami_flutter/my_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sure_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(
      children: [
        Image.asset(
          'assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text('${args.name}',
                  style: Theme.of(context).textTheme.headline1),
            ),
            body: Container(
              margin: EdgeInsets.only(
                  left: width * 0.1,
                  right: width * 0.05,
                  bottom: height * 0.06),
              width: width * 0.9,
              height: height * 0.9,
              decoration: BoxDecoration(
                  color: MyTheme.colorWhite,
                  borderRadius: BorderRadius.circular(24)),
              child: (verses.isEmpty)
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            verses[index] + '(${index + 1})',
                            style: Theme.of(context).textTheme.subtitle2,
                            textDirection: TextDirection.rtl,
                          ),
                        );
                      },
                      itemCount: verses.length,
                    ),
            )),
      ],
    );
  }

  void loadFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/sura/${index + 1}.txt');
    List<String> lines = fileContent.split('\n');
    verses = lines;
    setState(() {});
  }
}
