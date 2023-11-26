import 'package:flutter/material.dart';
import 'package:simple_api_demo/user_service.dart';

import 'model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserService _service = UserService();
  List<UsersModelData?> users = [];

  //TODO: Data load control should be added. circleavatar bla bla..

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Basic API Connection"),
        backgroundColor: Colors.lightGreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _service.fetchUsers().then((value) {
            if (value != null && value.data != null) {
              users = value.data!;
              setState(() {});
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${users[index]?.firstName!} ${users[index]?.lastName!}"),
            subtitle: Text(users[index]!.email!),
            trailing: Text("${users[index]!.id!}"),
            leading: Image.network(users[index]!.avatar!),
          );
        },
      ),
    ));
  }
}
