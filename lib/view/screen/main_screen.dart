import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:proj2_bmi/model/bn_sceen.dart';
import 'package:proj2_bmi/view/screen/calculator_screen.dart';

import 'history_screen.dart';
class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<BnScreen> _bnScreen = <BnScreen>[
    const BnScreen(widget: HistoryScreen()),
    BnScreen(widget: CalculatorScreen()),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bnScreen[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        mouseCursor: MouseCursor.defer,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFA557FF),
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
          });

        },
        currentIndex: _currentIndex,
        selectedItemColor:  Colors.white,
        selectedFontSize: 15,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFA557FF),
            activeIcon: Icon(Icons.history),
            icon: Icon(Icons.history),
            label: "history".tr(),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.calculate),
            icon: Icon(Icons.calculate_outlined),
            label: "bmi_calculator".tr(),
          ),

        ],
      ),
    );
  }
}