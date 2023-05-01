import 'package:flutter/material.dart';
import 'package:islami_flutter/home/quran/sura_details_screen.dart';

class SuraName extends StatelessWidget {
  String text;
  int index;

  SuraName({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name: text, index: index));
      },
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
