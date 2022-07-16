import 'dart:ui';

import 'package:flutter/material.dart';

class Commentaries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 64, bottom: 32),
      height: 60.0,
      child: Container(
        alignment: Alignment.centerRight,
        width: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 64,
                width: 250,
                child: FlatButton(
                    color: Color(0xffEAAB00),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      //Aquí debe haber una conexión para lanzar la interfaz de comentarios para visualizar todos los comentarios existentes
                      //Se debe poder crear comentarios
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Comentarios    ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff191919),
                            fontSize: 24.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(Icons.comment, color: Color(0xff191919)),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
