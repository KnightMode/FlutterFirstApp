import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'member.dart';
import 'strings.dart';

class GHFlutterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new GHFlutterState();
}

class GHFlutterState extends State<GHFlutterWidget> {
  var _members = <Member>[];

  final _textStyle = new TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Widget _buildRow(int i) {
    return new ListTile(
      title: new Text("${_members[i].login}", style: _textStyle),
      leading: new CircleAvatar(
        backgroundColor: Colors.lightGreen,
        backgroundImage: new NetworkImage(_members[i].avatarUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: Strings.appTitle,
        home: new Scaffold(
          appBar: new AppBar(title: new Text(Strings.appTitle)),
          body: new ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: _members.length,
              itemBuilder: (buildContext, i) {
                return _buildRow(i);
              }),
        ));
  }

  _loadData() async {
    String dataUrl = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataUrl);
    setState(() {
      final membersJSON = json.decode(response.body);

      for (var memberJSON in membersJSON) {
        final member =
            new Member(memberJSON["login"], memberJSON["avatar_url"]);
        _members.add(member);
      }
    });
  }
}
