import 'package:flutter/material.dart';
import 'package:islami_flutter/home/hadeth_tab.dart';
import 'package:islami_flutter/home/quran/quran_tab.dart';
import 'package:islami_flutter/home/radio_tab.dart';
import 'package:islami_flutter/home/tasbeeh_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
            title: Text('Islami', style: Theme.of(context).textTheme.headline1),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/quran.png'),
                  ),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/hadeth.png'),
                    ),
                    label: 'Hadeth'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/sebha.png'),
                    ),
                    label: 'Tasbeh'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/radio.png'),
                    ),
                    label: 'Radio'),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        )
      ],
    ); // stack
  }

  List<Widget> tabs = [QuranTab(), HadethTab(), TasbehTab(), RadioTab()];
}
