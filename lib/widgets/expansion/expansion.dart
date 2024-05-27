import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expansion extends StatefulWidget {
  const Expansion({super.key});

  @override
  State<Expansion> createState() => _ExpansionState();
}

class _ExpansionState extends State<Expansion> {
  final bool _customIcon = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExpansionTile(
          title: const Text('Expansion Tile'),
          trailing: Icon(
            _customIcon ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down,
          ),
          children: const <Widget>[
            ListTile(
              title: Text('This is number 2'),
            ),
          ],
          onExpansionChanged: (bool expanded) {},
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ],
    );
  }
}
