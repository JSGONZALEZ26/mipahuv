import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:herramientamanual/DashBoard/resource.dart';
import 'package:herramientamanual/Data/resources.dart';

FirebaseApp secondaryApp = Firebase.app('herramientamanual');
FirebaseFirestore firestore = FirebaseFirestore.instanceFor(app: secondaryApp);
var result;
bool _initialized = false;
bool _error = false;
List<Widget> resources = [];
List<Resource> aux = [];
Resource recurso;
Widget resource;

// ignore: must_be_immutable
class SearchedListName extends StatefulWidget {
  String value;
  SearchedListName(String value) {
    this.value = value;
  }

  @override
  _SearchedListNameState createState() => _SearchedListNameState();
}

class _SearchedListNameState extends State<SearchedListName> {
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      _error = true;
    }
  }

  Future loadResources() async {
    result = await FirebaseFirestore.instance
        .collection('resources')
        .where('name', isEqualTo: widget.value)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                setState(() {
                  recurso = new Resource(
                      doc['category'],
                      doc['description'],
                      doc['name'],
                      doc['source'],
                      doc['subject'],
                      doc['createdAt'],
                      doc.reference.id);
                  print(recurso.id + " / " + recurso.name);
                  aux.add(recurso);
                  resource = ResourceCard(recurso);
                  resources.add(resource);
                });
              })
            });
  }

  @override
  void initState() {
    resources = [];
    aux = [];
    initializeFlutterFire();
    super.initState();

    loadResources();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Text('Error, volver a cargar');
    }
    if (!_initialized) {
      return Text('Cargando');
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
            iconTheme: IconThemeData(color: Color(0xFF191919)),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Container(
              margin: EdgeInsets.all(30),
              child: Text(
                'RESULTADO DE BUSQUEDA: ',
                style: TextStyle(color: Color(0xff191919), fontSize: 30),
              ),
            )),
      ),
      body: DataList(),
    );
  }
}

class DataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: resources[index],
          );
        });
  }
}
