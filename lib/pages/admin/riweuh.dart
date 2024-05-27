import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Riweuh extends StatefulWidget {
  const Riweuh({super.key, required CircleAvatar leading, required title, required Text subtitle, required Text trailing, required bool dense});

  @override
  State<Riweuh> createState() => _RiweuhState();
}

class _RiweuhState extends State<Riweuh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const[
          ListTile(
            leading: CircleAvatar(
              child: Text('A'),
            ),
            title: Text('Dr. Muhammad Dwiya Lakhsmana'),
            subtitle: Text('Umum'),
            trailing: Text('4 th'),

            dense: true,
          ),
           ListTile(
            leading: CircleAvatar(
              child: Text('A'),
            ),
            title: Text('Dr. Firza Sharfina Izzati'),
            subtitle: Text('Umum'),
            trailing: Text('3 th'),

            dense: false,
          ),
        ],
      ),
    );
  }
}