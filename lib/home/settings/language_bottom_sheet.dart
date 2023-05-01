import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_flutter/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color:
          provider.isDark() ? MyTheme.bottomNavDarkColor : MyTheme.colorWhite,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
                onTap: () {
                  provider.changeLanguage('en');
                },
                child: provider.isEnglish()
                    ? getSelectedItem(AppLocalizations.of(context)!.english)
                    : getUnselectedWidget(
                        AppLocalizations.of(context)!.english)),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.isEnglish()
                  ? getUnselectedWidget(AppLocalizations.of(context)!.arabic)
                  : getSelectedItem(AppLocalizations.of(context)!.arabic),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lang,
          style: Theme.of(context).textTheme.headline3,
        ),
        Icon(Icons.check, color: Theme.of(context).primaryColor),
      ],
    );
  }

  Widget getUnselectedWidget(String lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lang,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
