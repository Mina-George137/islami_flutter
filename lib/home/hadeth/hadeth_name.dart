import 'package:flutter/material.dart';

import 'hadet_details_screen.dart';
import 'hadeth_tab.dart';

class HadethName extends StatelessWidget {
  Hadeth hadeth;

  HadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Text(
        hadeth.title,
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
