import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_flutter/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  List<String> tasbehat = [
    'سبحان الله',
    'الحمد لله ',
    'لا إله إلا الله',
    'الله أكبر',
    ' لا حول ولا قوة إلا بالله'
  ];

  int counter = 1;
  double _angle = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      child: Center(
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: provider.isDark()
                      ? Image.asset('assets/images/head_of_sebha_dark.png')
                      : Image.asset('assets/images/head_of_sebha.png'),
                ),
                InkWell(
                  onTap: () {
                    checkTasbeh();
                  },
                  child: Transform.rotate(
                    angle: _angle * (3.14 / 180),
                    child: provider.isDark()
                        ? Image.asset('assets/images/body_of_sebha_dark.png')
                        : Image.asset('assets/images/body_of_sebha.png'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                AppLocalizations.of(context)!.number_tasbehat,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: provider.isDark()
                      ? Theme.of(context).primaryColorDark
                      : const Color(0xFFB7935F),
                  borderRadius: BorderRadius.circular(12)),
              child: Text('$counter',
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  '${tasbehat[index % 5]}',
                  style: Theme.of(context).textTheme.headline4,
                )),
          ],
        ),
      ),
    );
  }

  void checkTasbeh() {
    if (counter == 33) {
      index++;
      counter = 1;
    } else {
      counter++;
    }
    rotateImage();
    setState(() {});
  }

  void rotateImage() {
    _angle += (360 / 33);
  }
}
