import 'package:e_klinik_pens/models/camera_actions.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/profiles/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditCoba extends StatefulWidget {
  const EditCoba({super.key});

  @override
  State<EditCoba> createState() => _EditCobaState();
}

class _EditCobaState extends State<EditCoba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: themeDark,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/atomic.png"),
            ),
            Column(
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  flex: 2,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0).r,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.arrow_back_ios_new_rounded), 
                                        color: pureWhite,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0145),
                                        child: Column(
                                          children: [
                                            Text("Profil", style: TextStyle(
                                              fontWeight: FontWeight.bold, 
                                              color: pureWhite,
                                              fontSize: MediaQuery.of(context).size.width * 0.055,
                                            ),
                                          ),
                                            Container(
                                              height: MediaQuery.of(context).size.height * 0.0275,
                                            ),
                                            Stack(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width * 0.280,
                                                  height: MediaQuery.of(context).size.height * 0.133,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(100),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                       Navigator.push(
                                                        context, 
                                                        MaterialPageRoute(builder: (context) => const CameraAction())
                                                        );
                                                      },
                                                      child: Image(
                                                        image: AssetImage("assets/images/profiles-pic.jpg"),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    width: MediaQuery.of(context).size.width * 0.07,
                                                    height: MediaQuery.of(context).size.height * 0.035,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(100),
                                                        color: Colors.white),
                                                    child: Image.asset(
                                                      "assets/images/camera.png",
                                                      color: themeLight,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35).r,
                        topRight: Radius.circular(35).r
                      ),
                      color: pureWhite
                    ),
                    child: ListView.builder(
                      itemCount: inputFields.length,
                      itemBuilder: (context, index){
                        final inputField= inputFields[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              inputField.label,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * 0.045
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.015,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                filled: true,
                                fillColor: fieldColor,
                              ),
                              textAlign: TextAlign.left,
                            )
                          ],
                        );
                      }
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}