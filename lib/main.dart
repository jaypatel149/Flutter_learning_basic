// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_page.dart';
import 'login_page.dart';
import 'tab_bar.dart';
import 'list_view.dart';
import 'grid_view.dart';
import 'stack_bar.dart';
import 'card.dart';
import 'checkbox.dart';
import 'radio_button.dart';
import 'images_page.dart';
import 'alert_dialog.dart';
import 'list_future.dart';

void main() => runApp(const MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _currentIndex = 0;
  final tabBottom = [
    const Center(
      child: Text(
        'Hi Home Page',
        style: TextStyle(fontSize: 50),
      ),
    ),
    const Center(
      child: Text(
        'Hi Search Page',
        style: TextStyle(fontSize: 50),
      ),
    ),
    const Center(
      child: Text(
        'Hi Profile Page',
        style: TextStyle(fontSize: 50),
      ),
    ),
    const Center(
      child: Text(
        'Hi Camera Page',
        style: TextStyle(fontSize: 50),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My first App'),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => handleClick(item),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(value: 0, child: Text('Settings')),
              const PopupMenuItem<int>(value: 1, child: Text('Abcdef')),
              const PopupMenuItem<int>(value: 1, child: Text('Logout')),
            ],
          ),
        ],
      ),
      body: tabBottom[_currentIndex],
      drawer: Drawer(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              const SizedBox(
                width: 10,
              ),
              const UserAccountsDrawerHeader(
                accountName: Text("flutterboy"),
                accountEmail: Text("flutterboy@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: Text("Jay"),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const ListTile(
                title: Text("All Page"),
                leading: Icon(Icons.pages),
              ),
              const Divider(
                height: 0.1,
              ),
              ListTile(
                title: const Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.login),
                onTap: () {
                  Get.to(const LoginPage());
                },
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: const Text(
                  "Signup",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.logout),
                onTap: () {
                  Get.to(const SignPage());
                },
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: const Text(
                  "Tabbar",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.tab),
                onTap: () {
                  Get.to(const TabBarDemo());
                },
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: const Text(
                  "Listview",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.list),
                onTap: () {
                  Get.to(const ListViewDemo());
                },
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: const Text(
                  "Gridview",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.grid_4x4),
                onTap: () {
                  Get.to(GridViewDemo());
                },
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: const Text(
                  "StackBar",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.stacked_bar_chart),
                onTap: () {
                  Get.to(const StackBar());
                },
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: const Text(
                  "Card",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.card_giftcard),
                onTap: () {
                  Get.to(const CardBar());
                },
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: const Text(
                  "Checkbox",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.check_box),
                onTap: () {
                  Get.to(const CheckboxDemo());
                },
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: const Text(
                  "Radiobutton",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.radio_button_checked),
                onTap: () {
                  Get.to(const RadioButtonDemo());
                },
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: const Text(
                  "Image",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.image),
                onTap: () {
                  Get.to(const ImagePage());
                },
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: const Text(
                  "AlertDialog",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.dangerous),
                onTap: () {
                  Get.to(const AlertDialogPage());
                },
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: const Text(
                  "FutureApiFetch",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.api),
                onTap: () {
                  Get.to(const FutureApi());
                },
                trailing: const Icon(Icons.arrow_forward),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
            backgroundColor: Color(0xFF1F1FE3),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: 'Search',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Profile',
            backgroundColor: Color(0xFF309C08),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera,
              color: Colors.black,
            ),
            label: 'Camera',
            backgroundColor: Color(0xFFDE12A8),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

void handleClick(int item) {
  switch (item) {
    case 0:
      break;
    case 1:
      break;
    case 2:
      break;
  }
}
