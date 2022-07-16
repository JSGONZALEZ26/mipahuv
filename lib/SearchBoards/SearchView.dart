import 'package:flutter/material.dart';
import 'package:herramientamanual/NavBar/src/nBar.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Container(
        width: 400,
        height: 320,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 64),
              child: Text(
                'BUSCAR POR: ',
                style: TextStyle(fontSize: 20),
              ),
            ),
            NBar(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
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
            )
          ],
        ),
      ),
    );
  }
}
