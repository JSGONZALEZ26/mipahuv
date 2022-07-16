import 'package:flutter/material.dart';
import 'package:herramientamanual/NavBar/NavBar.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(fontFamily: 'Gotham Narrow'),
      debugShowCheckedModeBanner: true,
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            NavBar(),
          ],
        ),
      ),
    );
  }
}
