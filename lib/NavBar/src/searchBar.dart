import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:herramientamanual/NavBar/src/chewie_list_item.dart';

class searchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 5, left: 14),
      height: 60.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
          color: Color(0xffF2F2F2),
        ),
        alignment: Alignment.centerRight,
        width: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Buscar',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xff191919),
                  fontSize: 24.0,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 32),
                child: FlatButton(
                    color: Color(0xffEAAB00),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      showSearch(context: context, delegate: BusquedaDatos());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.search, color: Color(0xff191919)),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}

class BusquedaDatos extends SearchDelegate<String> {
  final listaProgramas = [
    "NetBeans",
    "SQLServer",
    "MySql",
    "Node.js",
    "Android Studio",
    "Python IDE"
  ];
  final programasRecientes = [
    "NetBeans",
    "SQLServer",
    "MySql",
    "Node.js",
    "Android Studio",
    "Python IDE",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //acciones dentro de la barra de la aplicacion
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //icono en la izquierda de la barra
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //muestra resultados de busqueda
    return MyHomePage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //muestra el criterio de busqueda
    final suggestionList = query.isEmpty
        ? programasRecientes
        : listaProgramas.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.video_library),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}
