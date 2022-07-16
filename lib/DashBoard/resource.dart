import 'package:flutter/material.dart';
import 'package:herramientamanual/Data/resources.dart';
import 'package:herramientamanual/content.dart/content.dart';

// ignore: must_be_immutable
class ResourceCard extends StatefulWidget {
  Resource aux;
  ResourceCard(Resource auxR) {
    aux = auxR;
  }

  @override
  _ResourceCardState createState() => _ResourceCardState();
}

class _ResourceCardState extends State<ResourceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 1.0,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                widget.aux.name,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
              ),
              subtitle: Text(
                widget.aux.subject,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 32, bottom: 16),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Content(widget.aux)),
                        );
                      },
                      child: Text(
                        'Ver contenido',
                        style: TextStyle(
                            color: Color(0xff003F72),
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
