import 'package:flutter/material.dart';

import '../service/auth.service.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Login work.'),
            ElevatedButton(
              child: Text('login'),
              onPressed: () {
                authService.login();
              },
            )
          ],
        ),
      ),
    );
  }
}
