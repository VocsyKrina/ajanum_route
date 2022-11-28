import 'package:flutter/material.dart';

import '../main.dart';
import 'args.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          ElevatedButton(
            child: Text('users'),
            onPressed: () => router.pushNamed(
              '/users',
              arguments: 'x',
            ),
          ),
          ElevatedButton(
            child: Text('admin'),
            onPressed: () => router.pushNamed('/admin'),
          ),
          ElevatedButton(
            child: Text('add user'),
            onPressed: () => router.pushNamed<String>('/admin/add-user').then(print),
          ),
          ElevatedButton(
            child: Text('dog 1'),
            onPressed: () {
              router.pushNamed<String>('/dog/1').then((s) {
                print(s);
              });
            },
          ),
          ElevatedButton(
            child: Text('login'),
            onPressed: () => router.pushNamed('/login'),
          ),
          ElevatedButton(
            child: Text('redirect to dynamic path'),
            onPressed: () => router.pushNamed('/aa'),
          ),
          ElevatedButton(
            child: Text('to home'),
            onPressed: () {
              router.pushNamed('/');
            },
          ),
          ElevatedButton(
            child: Text('ArgsPage'),
            onPressed: () {
              router.pushNamed(
                '/arg',
                arguments: ArgsPageArguments()
                  ..name = 'ajanuw'
                  ..id = 1,
              );
            },
          ),
          ElevatedButton(
            child: Text('Other'),
            onPressed: () {
              router.pushNamed('/other');
            },
          ),
        ],
      ),
    );
  }
}
