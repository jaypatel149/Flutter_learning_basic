// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class StackBar extends StatelessWidget {
  const StackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack Widget Example"),
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.passthrough,
          children: <Widget>[
            // Max Size Widget
            Container(
              height: 300,
              width: 400,
              color: Colors.green,
              child: const Center(
                child: Text(
                  'Top Widget: Green',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 20,
              child: Container(
                height: 100,
                width: 150,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Middle Widget',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 30,
                left: 20,
                child: Container(
                  height: 100,
                  width: 150,
                  color: Colors.orange,
                  child: const Center(
                    child: Text(
                      'Bottom Widget',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
