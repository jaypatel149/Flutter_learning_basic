// ignore_for_file: camel_case_types

import 'package:http/http.dart' as http;
// import 'package:json_annotation/json_annotation.dart';
// import 'package:json_serializable/json_serializable.dart';
// import 'package:build_runner/build_runner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:async';
import 'dart:convert';

// Future<List<Post>> fetchPost() async {
//   final response =
//       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

//   if (response.statusCode == 200) {
//     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

//     return parsed.map<Post>((json) => Post.fromMap(json)).toList();
//   } else {
//     throw Exception('Failed to load album');
//   }
// }

// List<Post> postFromJson(String str) =>
//     List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

// class Post {
//   Post({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.body,
//   });

//   int userId;
//   int id;
//   String title;
//   String body;

//   factory Post.fromMap(Map<String, dynamic> json) => Post(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//       );
// }

// class FutureApi extends StatefulWidget {
//   const FutureApi({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<FutureApi> {
//   late Future<List<Post>> futurePost;

//   @override
//   void initState() {
//     super.initState();
//     futurePost = fetchPost();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Fetch Data Example'),
//       ),
//       body: FutureBuilder<List<Post>>(
//         future: futurePost,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (_, index) => Container(
//                 child: Container(
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   padding: const EdgeInsets.all(20.0),
//                   decoration: BoxDecoration(
//                     color: const Color(0xff97FFFF),
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "${snapshot.data![index].title}",
//                         style: const TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Text("${snapshot.data![index].body}"),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }

// ##################GridView fetch Api http#####################

// class FutureApi extends StatefulWidget {
//   const FutureApi({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<FutureApi> {
//   // ignore: library_private_types_in_public_api
//   late List data;
//   List imagesUrl = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchDataFromApi();
//   }

//   Future<String> fetchDataFromApi() async {
//     var jsonData = await http
//         .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
//     var fetchData = jsonDecode(jsonData.body);

//     setState(() {
//       data = fetchData;
//       for (var element in data) {
//         imagesUrl.add(element['url']);
//         // imagesUrl.add(element['title']);
//       }
//     });

//     return "Success";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text('List Of Images'),
//         centerTitle: true,
//       ),
//       body: GridView.builder(
//         gridDelegate:
//             const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
//         itemCount: imagesUrl.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Image.network(
//             imagesUrl[index],
//             fit: BoxFit.cover,
//           );
//         },
//       ),
//     );
//   }
// }

// #################ListViewbulder fetch Api Http#######go to nextpage details#################

class FutureApi extends StatelessWidget {
  const FutureApi({Key? key}) : super(key: key);

  Future<List<dynamic>> fetchUsers() async {
    var result =
        await http.get(Uri.parse("https://randomuser.me/api/?results=10"));
    return json.decode(result.body)['results'];
  }

  String _name(dynamic user) {
    return user['name']['title'] +
        " " +
        user['name']['first'] +
        " " +
        user['name']['last'];
  }

  String _location(dynamic user) {
    return user['location']['country'];
  }

  String _age(Map<dynamic, dynamic> user) {
    return "Age: ${user['dob']['age']}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch-Api-Http Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // debugPrint(_age(snapshot.data[0]));
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  snapshot.data[index]['picture']['medium'],
                                ),
                              ),
                              title: Text(_name(snapshot.data[index])),
                              subtitle: Text(_location(snapshot.data[index])),
                              trailing: Text(_age(snapshot.data[index])),
                              onTap: () {
                                Get.to<void>(DetailScreen(
                                  name: _name(snapshot.data[index]),
                                  location: _location(snapshot.data[index]),
                                  age: _age(snapshot.data[index]),
                                  url: snapshot.data[index]['picture']
                                      ['medium'],
                                ));
                              }),
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({super.key, this.name, this.location, this.age, this.url});

  // Declare a field that holds the Todo.
  // final Todo todo;

  final String? name, location, age, url;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            width: 500,
            height: 300,
            child: Card(
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(url.toString()),
                  Text(name.toString()),
                  Text(location.toString()),
                  Text(age.toString())
                ],
              ),
            )),
      ),
    );
  }
}
