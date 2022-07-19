import 'package:flutter/material.dart';

class AlertDialogPage extends StatelessWidget {
  const AlertDialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertDialog'),
        centerTitle: true,
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: ElevatedButton(
          child: const Text('Show Dialog'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Container(
                    child: AlertDialog(
                        title: const Text('Accept?'),
                        content: const Text('Do you accept?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Yes'))
                        ]),
                  );
                });
          },
        ),
      ),
    );
  }
}
