import 'package:e_klinik_pens/models/faq_lists.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/profiles/profile.dart';
import 'package:flutter/material.dart';

class FaqTiles extends StatefulWidget {
  final String title;
  final String desc;

   const FaqTiles({ 
    super.key, required this.title, required this.desc, 
    });

  @override
  State<FaqTiles> createState() => _FaqTilesState();
}

class _FaqTilesState extends State<FaqTiles> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.0425, 
        vertical: MediaQuery.of(context).size.height * 0.0125
      ),
      child: ExpansionTile(
              title: Text(
              widget.title,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.0475,
                fontWeight: FontWeight.w500
              ),
            ),
              shape: Border(
                bottom: BorderSide(
                  color: divider
                )
              ),
              collapsedIconColor: themeDark,
              iconColor: themeDark,
              children: <Widget>[
                ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                    widget.desc, 
                    style: const TextStyle(
                      color: textColor
                    ),
                    ),
                  ),
                ),
              ],
             ),         
    );
  }
}
