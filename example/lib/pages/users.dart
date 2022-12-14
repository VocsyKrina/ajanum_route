import 'package:flutter/material.dart';

import '../data/users.dart';
import '../main.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => router.pushNamed('/'),
          ),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: ListSearchPage(),
                );
              },
            ),
          )
        ],
      ),
      body: ListView(
        children: users
            .map((u) => ListTile(
                  leading: Text('#' + u.id.toString()),
                  title: Text(u.name),
                  onTap: () {
                    router.pushNamed(u.id.toString(), arguments: u);
                  },
                ))
            .toList(),
      ),
    );
  }
}

class ListSearchPage extends SearchDelegate<String> {
  @override
  appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  /// 用户从搜索页面提交搜索后显示的结果
  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('提交搜索结果: $query'),
    );
  }

  /// 当用户在搜索字段中键入查询时，在搜索页面正文中显示的建议
  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(query.toUpperCase()),
    );
  }
}
