import 'dart:ui';

import 'package:flutter/material.dart';

class softwareName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'U' ,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Color(0xffF2F2F2),
                  fontSize: 42.0),
            ),
            Text(
              'TPL',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Color(0xffEAAB00),
                  fontSize: 24.0),
            )
          ],
        ),
      ),
    );
  }
}
