import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Card with Listview',
          style: TextStyle(color: Color(0xFF171717)),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF373535),
      body: ListView.builder(
          itemCount: 14,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: const Color(0xFFEBE4E4),
              child: ListTile(
                leading: const Icon(
                  Icons.alarm,
                  color: Colors.red,
                ),
                title: const Text(
                  'Alarn',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('List--${index++}'),
              ),
            );
          }),
    );
  }
}
