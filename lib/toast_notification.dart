import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastNotification extends StatefulWidget {
  const ToastNotification({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ToastNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toast Notification"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: 'It is toast Notification',
                toastLength: Toast.LENGTH_SHORT,
              );
            },
            child: const Text("Toast Show"),
          ),
          const SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
  }
}
