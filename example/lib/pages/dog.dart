import 'package:ajanum_route/ajanuw_route_argument.dart';
import 'package:ajanum_route_example/main.dart';
import 'package:flutter/material.dart';

part 'dog.g.dart';

@ara
class Dog extends StatefulWidget {
  final String? id;

  const Dog({Key? key, this.id}) : super(key: key);
  @override
  _DogState createState() => _DogState();
}

class _DogState extends State<Dog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Dog work. ${widget.id}'),
              SizedBox(width: 12),
              TextButton(
                // color: Colors.pinkAccent,
                child: Text('POP'),
                onPressed: () => router.pop('dog page pop!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
