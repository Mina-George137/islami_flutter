import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_flutter/home/hadeth/hadeth_name.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {
      loadHadethFile();
    }
    return Container(
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/hadeth_header_image.png'),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
            ),
            Text(
              '${AppLocalizations.of(context)!.hadeth_name}',
              style: Theme.of(context).textTheme.headline2,
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
            ),
            Expanded(
              child: (hadethList.isEmpty)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 2,
                          color: Theme.of(context).primaryColor,
                        );
                      },
                      itemBuilder: (context, index) {
                        return HadethName(hadeth: hadethList[index]);
                      },
                      itemCount: hadethList.length,
                    ),
            )
          ],
        ),
      ),
    );
  }

  var Ahadeth = [];

  void loadHadethFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/hadeth/ahadeth .txt');
    List<String> allAhadethList = fileContent.split('#\r\n');
    for (int i = 0; i < allAhadethList.length; i++) {
      List<String> singleHadeth = allAhadethList[i].split('\n');
      String title = singleHadeth[0];
      singleHadeth.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: singleHadeth);
      hadethList.add(hadeth);
    }
    print(hadethList.length);
    setState(() {});
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
