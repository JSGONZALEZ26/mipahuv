import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:herramientamanual/Commentaries/commentList.dart';
import 'package:herramientamanual/Data/resources.dart';
import 'package:herramientamanual/content.dart/src/video.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class Content extends StatefulWidget {
  Resource aux;

  Content(Resource aux) {
    this.aux = aux;
  }
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  void initState() {
    print(widget.aux.id + ' / ' + widget.aux.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Color(0xff191919),
          iconTheme: IconThemeData(color: Color(0xFF191919)),
        ),
        body: Container(
          margin: EdgeInsets.all(64),
          child: Stack(children: [
            Positioned(
              child: Container(
                  height: MediaQuery.of(context).size.width,
                  width: 1280 / 2.5,
                  child: VideoItem(
                    videoPlayerController:
                        VideoPlayerController.network(widget.aux.source),
                    looping: true,
                  )),
            ),
            Positioned(
              left: 600,
              child: SingleChildScrollView(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Stack(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2.0, color: Color(0xffE0DED8))),
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 150,
                                child: AutoSizeText(
                                  widget.aux.name,
                                  maxLines: 5000,
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(bottom: 30, top: 32),
                                height: 64,
                                alignment: Alignment.topLeft,
                                decoration:
                                    BoxDecoration(color: Colors.transparent),
                                child: Row(
                                  children: [
                                    Text(
                                      'SOFTWARE: ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      widget.aux.subject,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ],
                                )),
                            Container(
                              margin: EdgeInsets.only(bottom: 16),
                              height: 38,
                              alignment: Alignment.topLeft,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Text(
                                'DESCRIPCIÓN:',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w900),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 250),
                              alignment: Alignment.topLeft,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: AutoSizeText(
                                  widget.aux.description,
                                  maxLines: 50000,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: RaisedButton(
                            onPressed: null,
                            color: Color(0xff191919),
                          ),
                        )
                      ],
                    )),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                  onPressed: () {
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CommentariesListName(widget.aux.id);
                        });
                  },
                  elevation: 0,
                  backgroundColor: Color(0xffEAAB00),
                  foregroundColor: Color(0xff191919),
                  label: Text(
                    'Comentarios',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                  )),
            )
          ]),
        ));
  }
}
