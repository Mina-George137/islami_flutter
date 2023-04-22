import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return Container(
      child: Center(
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Image.asset('assets/images/head_of_sebha.png'),
                ),
                Transform.rotate(
                  angle: _angle * (3.14 / 180),
                  child: Image.asset(
                    'assets/images/body_of_sebha.png',
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
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Text('$counter',
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  primary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: checkTasbeh,
                child: Text(
                  '${tasbehat[index % 5]}',
                  style: Theme.of(context).textTheme.headline4,
                ))
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
