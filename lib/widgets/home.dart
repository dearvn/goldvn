import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:giavang/shared/colors.dart';
import 'package:giavang/widgets/alerts/alerts_section.dart';
import 'package:giavang/widgets/gold/gold_section.dart';
import 'package:giavang/widgets/dollar/dollar_section.dart';

class StockMarketAppHome extends StatefulWidget {
  @override
  _StockMarketAppHomeState createState() => _StockMarketAppHomeState();
}

class _StockMarketAppHomeState extends State<StockMarketAppHome> {
  int _selectedIndex = 0;

  final List<Widget> tabs = [GoldSection(), DollarSection(), AlertsSection()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldBackground,
        body: tabs.elementAt(_selectedIndex),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.white30,
                selectedIndex: _selectedIndex,
                tabs: _bottomNavigationBarItemItems(),
                onTabChange: _onItemTapped),
          ),
        ));
  }

  List<GButton> _bottomNavigationBarItemItems() {
    return [
      GButton(
          icon: FontAwesomeIcons.coins,
          text: 'Giá vàng',
          backgroundColor: Colors.white30,
          iconActiveColor: Colors.yellow,
          iconColor: Colors.yellowAccent,
          textColor: Colors.white30),
      GButton(
          icon: FontAwesomeIcons.commentDollar,
          text: 'Tỷ Giá',
          backgroundColor: Colors.white30,
          iconActiveColor: Colors.yellow,
          iconColor: Colors.yellowAccent,
          textColor: Colors.white30),
      GButton(
          icon: FontAwesomeIcons.solidBell,
          text: 'Tín hiệu',
          backgroundColor: Colors.white30,
          iconActiveColor: Colors.yellow,
          iconColor: Colors.yellowAccent,
          textColor: Colors.white30),
    ];
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }
}
