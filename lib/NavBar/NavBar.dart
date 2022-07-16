import 'package:flutter/material.dart';
import 'package:herramientamanual/NavBar/src/SoftwareName.dart';
import 'package:herramientamanual/NavBar/src/nBar.dart';
import 'package:herramientamanual/NavBar/src/searchBar.dart';
import 'package:herramientamanual/main.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: 300.0,
        color: Color(0xff003F72),
        child: Stack(
          children: [
            ListView(children: [
              softwareName(),
              searchBar(),
              MyApp(),
            ]),
            Align(alignment: Alignment.center, child: NBar()),
          ],
        ),
      ),
    );
  }
}
