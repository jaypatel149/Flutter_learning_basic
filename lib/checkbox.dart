import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<CheckboxDemo> {
  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Checkbox Example'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Checkbox with Header and Subtitle',
                style: TextStyle(fontSize: 20.0),
              ),
              CheckboxListTile(
                secondary: const Icon(Icons.alarm),
                title: const Text('Ringing at 4:30 AM every day'),
                subtitle: const Text('Ringing after 12 hours'),
                value: valuefirst,
                onChanged: (value) {
                  setState(() {
                    valuefirst = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: const Icon(Icons.alarm),
                title: const Text('Ringing at 5:00 AM every day'),
                subtitle: const Text('Ringing after 12 hours'),
                value: valuesecond,
                onChanged: (value) {
                  setState(() {
                    valuesecond = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
