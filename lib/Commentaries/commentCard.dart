import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:herramientamanual/Data/coment.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CommentaryCard extends StatefulWidget {
  Commentary aux;
  var auxDate;
  var auxTimestamp;

  TextEditingController score = new TextEditingController();
  TextEditingController user = new TextEditingController();
  TextEditingController comment = new TextEditingController();
  CommentaryCard(Commentary auxR) {
    this.aux = auxR;
    this.auxTimestamp = this.aux.createdAt.toDate();
    this.auxDate = DateFormat.yMMMd().format(this.auxTimestamp);
  }

  @override
  _ResourceCardState createState() => _ResourceCardState();
}

class _ResourceCardState extends State<CommentaryCard> {
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {}
  }

  CollectionReference comments =
      FirebaseFirestore.instance.collection('commentaries');

  Future<void> deleteComment() {
    return comments
        .doc(widget.aux.id)
        .delete()
        .then((value) => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                content: Text('Comentario borrado',
                    style: TextStyle(fontWeight: FontWeight.w900)),
              );
            }))
        .catchError((error) => print('No se puedo borrar comentario'));
  }

  Future<void> updateComment(double score, String content) {
    return comments
        .doc(widget.aux.id)
        .update({'score': score, 'content': content}).then(
            (value) => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    content: Text('Comentario actualizado',
                        style: TextStyle(fontWeight: FontWeight.w900)),
                  );
                }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Card(
        color: Color(0xffF2F2F2),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFFE0DED8), width: 2),
            borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.all(16),
              subtitle: Row(
                children: [
                  Text(
                    'USUARIO: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
                  ),
                  Text(
                    widget.aux.user,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              title: Text(
                widget.aux.content,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w100),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'FECHA: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          widget.auxDate,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                    Row(children: [
                      FlatButton.icon(
                        onPressed: () {
                          widget.score.text = widget.aux.score.toString();
                          widget.user.text = widget.aux.user;
                          widget.comment.text = widget.aux.content;
                          return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  title: Text('Editar contenido'),
                                  content: Container(
                                    height: 500,
                                    width: 500,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: FloatingActionButton.extended(
                                            backgroundColor: Color(0xffEAAB00),
                                            onPressed: () {
                                              double auxScore = double.parse(
                                                  widget.score.text);
                                              String auxContent =
                                                  widget.comment.text;
                                              updateComment(
                                                  auxScore, auxContent);
                                            },
                                            elevation: 0,
                                            label: Text(
                                              'Actualizar',
                                              style: TextStyle(
                                                  color: Color(0xff191919),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            icon: Icon(Icons.update,
                                                color: Color(0xff191919)),
                                          ),
                                        ),
                                        Container(
                                          height: 400,
                                          width: 500,
                                          child: ListView(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(16),
                                                child: TextField(
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w100),
                                                    decoration: InputDecoration(
                                                        labelStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                        labelText:
                                                            'Calificación: '),
                                                    controller: widget.score),
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(16),
                                                child: TextField(
                                                    enabled: false,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w100),
                                                    decoration: InputDecoration(
                                                        labelStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                        labelText:
                                                            'Correo electrónico del usuario: '),
                                                    controller: widget.user),
                                              ),
                                              Container(
                                                child: Text(
                                                  'Quisiera comentar que: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(16),
                                                child: TextField(
                                                  maxLines: 50,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                  controller: widget.comment,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: Icon(Icons.edit),
                        label: Text(''),
                      ),
                      FlatButton.icon(
                        onPressed: () {
                          return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  title: Center(
                                    child: Text("¿Eliminar comentario?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900)),
                                  ),
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Atras',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          )),
                                      FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              deleteComment();
                                            });
                                          },
                                          child: Text(
                                            'Eliminar',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ))
                                    ],
                                  ),
                                );
                              });
                        },
                        icon: Icon(Icons.delete),
                        label: Text(''),
                      ),
                    ])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
