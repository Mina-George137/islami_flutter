import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_flutter/home/quran/sura_details_screen.dart';
import 'package:islami_flutter/home_screen.dart';
import 'package:islami_flutter/my_theme.dart';
import 'package:islami_flutter/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/hadeth/hadet_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child: MyApp(
        prefs: prefs,
      )));
  //create: (context) => AppConfigProvider(), child: MyApp(isEnglish: isEnglish,isDark: isDark)));
}

class MyApp extends StatelessWidget {
  SharedPreferences prefs;

  MyApp({Key? key, required this.prefs}) : super(key: key);

  //MyApp({Key? key, required this.isEnglish,required this.isDark}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    bool isDark = prefs.getBool('isDark')!;
    bool isEnglish = prefs.getBool('isEnglish')!;

    if (isDark) {
      provider.appTheme = ThemeMode.dark;
    } else {
      provider.appTheme = ThemeMode.light;
    }

    if (isEnglish) {
      provider.appLanguage = 'en';
    } else {
      provider.appLanguage = 'ar';
    }

    return MaterialApp(
      title: 'Islami App',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      themeMode: provider.appTheme,
    );
  }
}
