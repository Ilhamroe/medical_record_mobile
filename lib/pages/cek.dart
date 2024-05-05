import 'package:flutter/material.dart';

class Tes extends StatelessWidget {
  const Tes({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.orange,
          ),
          const Divider(
            color: Colors.white,
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 40,
          ),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.orange,
          )
        ],
      ),
    );
  }
}