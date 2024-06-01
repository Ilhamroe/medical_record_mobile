import 'package:flutter/material.dart';
import 'package:e_klinik_pens/utils/color.dart';

Widget customDivider(BuildContext context){
  return Divider(
            indent: MediaQuery.of(context).size.width * 0.05,
            endIndent: MediaQuery.of(context).size.width * 0.05,
            color: aquaHaze,
          );
}

Widget customSpasi(BuildContext context){
  return SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        );
}