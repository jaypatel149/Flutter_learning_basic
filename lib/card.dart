// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CardBar extends StatelessWidget {
  const CardBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card page"),
      ),
      body: Center(
          child: Container(
        width: 300,
        height: 200,
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.red,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album, size: 60),
                title: Text('Sonu Nigam', style: TextStyle(fontSize: 30.0)),
                subtitle: Text('Best of Sonu Nigam Music.',
                    style: TextStyle(fontSize: 18.0)),
              ),
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    child: const Text('Play'),
                    onPressed: () {/* ... */},
                  ),
                  RaisedButton(
                    child: const Text('Pause'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
