import 'package:flutter/material.dart';
import 'package:herramientamanual/SearchBoards/src/searchListSoftware.dart';

class SearchBarSoftware extends StatefulWidget {
  @override
  _SearchBarSoftwareState createState() => _SearchBarSoftwareState();
}

class _SearchBarSoftwareState extends State<SearchBarSoftware> {
  final myController = TextEditingController();
  String aux;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Container(
        width: 350,
        height: 250,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 64),
              child: Text(
                'Buscar por nombre de programa: ',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            ),
            TextField(
              controller: myController,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(30),
                      child: RaisedButton(
                        color: Color(0xffEAAB00),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          aux = myController.text.toLowerCase();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SearchedListSoftware(aux)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'BUSCAR',
                            style: TextStyle(
                                color: Color(0xff191919),
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(30),
                      child: RaisedButton(
                        color: Color(0xff191919),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Atras',
                            style: TextStyle(
                                color: Color(0xffF2F2F2),
                                fontSize: 20,
                                fontWeight: FontWeight.w100),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
