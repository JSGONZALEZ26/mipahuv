import 'package:flutter/material.dart';
import 'package:herramientamanual/NavBar/src/chewie_list_item.dart';

class NBar extends StatefulWidget {
  @override
  _NBarState createState() => _NBarState();
}

class _NBarState extends State<NBar> {
  List<bool> selected = [true, false, false, false, false];

  void select(int n) {
    for (int i = 0; i < 5; i++) {
      if (i != n) {
        selected[i] = false;
      } else {
        selected[i] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: Column(
        children: [
          NBarItem(
            active: selected[0],
            texto: 'Programa UNO',
            touched: () {
              setState(() {
                select(0);
              });
            },
          ),
          NBarItem(
            active: selected[1],
            texto: 'Programa DOS',
            touched: () {
              setState(() {
                select(1);
              });
            },
          ),
          NBarItem(
            active: selected[2],
            texto: 'Programa TRES',
            touched: () {
              setState(() {
                select(2);
              });
            },
          ),
        ],
      ),
    );
  }
}

class NBarItem extends StatefulWidget {
  final String texto;
  final Function touched;
  final bool active;

  NBarItem({this.active, this.touched, this.texto});

  @override
  _NBarItemState createState() => _NBarItemState(this.texto);
}

class _NBarItemState extends State<NBarItem> {
  final String texto;

  _NBarItemState(this.texto);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.touched();
        },
        splashColor: Color(0xff191919),
        hoverColor: Colors.white12,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 60.0,
                width: 250.0,
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 255),
                      height: 35.0,
                      width: 5.0,
                      decoration: BoxDecoration(
                          color: widget.active
                              ? Color(0xffEAAB00)
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0))),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 40.0),
                              child: Text(
                                texto,
                                style: TextStyle(
                                    color: Color(0xffF2F2F2),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20.0),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
