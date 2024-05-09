import 'package:e_klinik_pens/models/faq_lists.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FaqTiles extends StatefulWidget {
    final FaqLists faqLists;
    bool isExpanded;

   FaqTiles({ 
    super.key, 
    required this.faqLists, 
    required this.isExpanded, 
    });

  @override
  State<FaqTiles> createState() => _FaqTilesState();
}

class _FaqTilesState extends State<FaqTiles> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.0625),
      child: ExpansionTile(
              title: Text(
              widget.faqLists.title, 
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.055,
                fontWeight: FontWeight.w500
              ),
            ),
              trailing: Transform.rotate(
                angle: widget.isExpanded ? 3.14159 : 0,
                child: Image.asset(
                  "assets/images/downarrow.png"
                ),
              ),
              shape: Border.all(color: Colors.transparent),
              collapsedIconColor: themeDark,
              iconColor: themeDark,
              initiallyExpanded: widget.isExpanded,
              children: <Widget>[
                ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                    widget.faqLists.description, 
                    style: TextStyle(
                      color: textColor
                    ),
                    ),
                  ),
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  widget.isExpanded= expanded;
                });
              },
              ),         
    );
  }
}
