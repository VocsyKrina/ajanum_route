import 'package:flutter/material.dart';

import '../data/users.dart';
import '../main.dart';

class User extends StatefulWidget {
  final int id;

  const User({Key? key, required this.id}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    String? name;
    if (users.map((u) => u.id).toList().indexOf(widget.id) > -1) {
      name = users.firstWhere((u) => u.id == widget.id).name;
    }

    return Scaffold(
      appBar: AppBar(title: Text("User [${widget.id}]")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            name != null ? Text('Hi i\'m "$name"') : Text('null'),
            ElevatedButton(
              child: Text('to user settings'),
              onPressed: () => router.pushNamed('user-settings'),
            ),
            ElevatedButton(
              child: Text('pushNamedAndRemoveUntil("/", (_) => false)'),
              onPressed: () => router.pushNamedAndRemoveUntil('/', (_) => false),
            ),
            ElevatedButton(
              child: Text("pushNamedAndRemoveUntil('/users', ModalRoute.withName('/home'))"),
              onPressed: () {
                router.pushNamedAndRemoveUntil('/users', ModalRoute.withName('/home'));
              },
            ),
            widget.id == 3
                ? ElevatedButton(
                    child: Text('to user 1'),
                    onPressed: () => router.pushNamed('../1'),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
