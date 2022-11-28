import 'package:flutter/material.dart';

import '../main.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Admin work.'),
            result != null ? Text(result!) : SizedBox(),
            ElevatedButton(
              child: Text('add user'),
              onPressed: () async {
                String name = (await router.navigator!.pushNamed('add-user')) as String;
                setState(() {
                  result = name.toUpperCase();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
