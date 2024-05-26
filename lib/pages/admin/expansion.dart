import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expansion extends StatefulWidget {
  const Expansion({Key? key}) : super(key: key);

  @override
  State<Expansion> createState() => _ExpansionState();
}

class _ExpansionState extends State<Expansion> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const[
          ListTile(
            leading: CircleAvatar(
              child: Text('A'),
            ),
            title: Text('Dr. Arna'),
            subtitle: Text('Umum'),
            trailing: Text('4 th'),

            //isThreeLine: true,
          ),
           ListTile(
            leading: CircleAvatar(
              child: Text('A'),
            ),
            title: Text('Dr. Firza Sharfina Izzati'),
            subtitle: Text('Umum'),
            trailing: Text('3 th'),
          ),
        ],
      ),
    );
  }
}
