import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/radio_large.png'),
            Text(
              AppLocalizations.of(context)!.quranRadio,
              style: Theme.of(context).textTheme.headline2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.skip_previous,
                  size: 50,
                  color: Theme.of(context).primaryColor,
                ),
                Icon(Icons.play_arrow,
                    size: 90, color: Theme.of(context).primaryColor),
                Icon(Icons.skip_next,
                    size: 50, color: Theme.of(context).primaryColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}
