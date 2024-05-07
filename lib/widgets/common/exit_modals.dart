import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/profiles/profile.dart';
import 'package:flutter/material.dart';

class ExitModals{
    static Future<bool> onBackButtonPressed(BuildContext context) async{
    bool? exitApp= await showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: pureWhite,
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: pureWhite,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/exit-xxl.png",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                Text(
                  "Apakah Anda yakin untuk", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.055, 
                  ),
                ),
                Text(
                  "keluar dari akun Anda?", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.055, 
                  ),
                ),
                customSpasi(context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeDark,
                      foregroundColor: pureWhite,   
                      elevation: 6,
                       padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.0175),
                        textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        )
                    ),
                    onPressed: () {
                         Navigator.of(context).pop(true);
                    }, 
                    child:  Text("Keluar")
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.transparent,
                      ),
                      backgroundColor: pureWhite,
                      foregroundColor: themeDark,                       
                      elevation: 6,
                       padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.0175),
                        textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        )
                    ),
                    onPressed: () {
                       Navigator.of(context).pop(false);
                    }, 
                    child: Text("Kembali")
                  ),
                ),
              ],
            ),
          )
        );
      }
    );
    return exitApp ?? false;
  }
}