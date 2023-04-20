import 'package:flutter/material.dart';
import 'package:islami_flutter/home/hadeth/hadeth_tab.dart';
import 'package:islami_flutter/my_theme.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details_screen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
              title: Text('${args.title}',
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
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      args.content[index],
                      style: Theme.of(context).textTheme.subtitle2,
                      textDirection: TextDirection.rtl,
                    ),
                  );
                },
                itemCount: args.content.length,
              ),
            )),
      ],
    );
  }
}
