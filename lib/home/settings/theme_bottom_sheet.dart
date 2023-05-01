import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_flutter/my_theme.dart';
import 'package:islami_flutter/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
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
                  provider.changeTheme(ThemeMode.light);
                },
                child: !provider.isDark()
                    ? getSelectedItem(AppLocalizations.of(context)!.light)
                    : getUnselectedItem(AppLocalizations.of(context)!.light)),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.isDark()
                  ? getSelectedItem(AppLocalizations.of(context)!.dark)
                  : getUnselectedItem(AppLocalizations.of(context)!.dark),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String appTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          appTheme,
          style: Theme.of(context).textTheme.headline3,
        ),
        Icon(Icons.check, color: Theme.of(context).primaryColor),
      ],
    );
  }

  Widget getUnselectedItem(String appTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          appTheme,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
