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

class ContentList extends StatefulWidget {
  @override
  _ContentListState createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
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
        .orderBy('name')
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

    return DataList();
  }
}

class DataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return resources[index];
        });
  }
}
