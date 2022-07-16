import 'package:flutter/material.dart';
import 'package:herramientamanual/SearchBoards/src/searchListName.dart';

class SearchBarName extends StatefulWidget {
  @override
  _SearchBarNameState createState() => _SearchBarNameState();
}

class _SearchBarNameState extends State<SearchBarName> {
  final nameController = TextEditingController();
  String aux = "";
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
                'Buscar por nombre de recurso: ',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            ),
            TextField(
              controller: nameController,
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
                          aux = nameController.text;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SearchedListName(aux.toLowerCase())),
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
