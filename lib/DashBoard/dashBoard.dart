import 'package:flutter/material.dart';
import 'package:herramientamanual/DashBoard/src/tabs.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 64.0,
        left: 400.0,
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.65,
            child: Stack(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16, bottom: 30),
                      height: 64,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2.0, color: Color(0xffE0DED8))),
                          color: Colors.transparent),
                      child: Text(
                        'LABORATORIO DE PROGRAMACIÓN',
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16, bottom: 30),
                      height: 64,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Text(
                        'Contenido disponible:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin: EdgeInsets.only(top: 50, bottom: 30),
                      height: 400,
                      width: double.infinity,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: ContentList()),
                ),
              
              ],
            )));
  }
}
