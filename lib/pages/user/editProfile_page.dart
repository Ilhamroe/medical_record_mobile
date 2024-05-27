import 'package:e_klinik_pens/models/camera_actions.dart';
import 'package:e_klinik_pens/models/user_profiles.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/utils/user_profiles.dart';
import 'package:e_klinik_pens/widgets/profiles/profile.dart';
import 'package:e_klinik_pens/widgets/profiles/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? selectedValue;
  User user = UserProfiles.myUser;
  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedValue = UserProfiles.myUser.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          color: themeLight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/atomic.png"),
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 16),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon:
                                  const Icon(Icons.arrow_back_ios_new_rounded),
                              color: pureWhite,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.0145),
                              child: Column(
                                children: [
                                  Text(
                                    "Profil",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: pureWhite,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.055,
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.0275,
                                  ),
                                  Stack(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.280,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.133,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const CameraAction()));
                                            },
                                            child: const Image(
                                              image: AssetImage(
                                                  "assets/images/profiles-pic.jpg"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.07,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.035,
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
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      children: [
                        customSpasi(context),
                        CustomTextField(
                            label: "Nama :",
                            text: user.name,
                            blurText: false,
                            onChanged: (name) {}),
                        customSpasi(context),
                        Text(
                          "Jenis Kelamin :",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        DropdownButtonFormField<String>(
                          value: selectedValue,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: fieldColor,
                          ),
                          items: ["Laki-laki", "Perempuan"].map((String e) {
                            return DropdownMenuItem<String>(
                                value: e, child: Text(e));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                              UserProfiles.myUser.gender = value ?? "";
                            });
                          },
                          elevation: 8,
                          dropdownColor: fieldColor,
                        ),
                        customSpasi(context),
                        Text(
                          "Tanggal Lahir :",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        TextFormField(
                          controller: _dateController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: fieldColor,
                            hintText: "Masukkan Tanggal Lahir Anda",
                            suffixIcon: GestureDetector(
                              child: Image.asset(
                                "assets/images/calendar.png",
                                width: 6,
                                height: 6,
                              ),
                              onTap: () async {
                                final DateTime? _date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(2000),
                                  firstDate: DateTime.now().subtract(
                                      const Duration(days: 365 * 100)),
                                  lastDate: DateTime.now(),
                                );
                                final _formattedDate =
                                    DateFormat("dd-MM-yyyy").format(_date!);
                                print(_formattedDate);

                                setState(() {
                                  _dateController.text =
                                      _formattedDate.toString();
                                });
                                print(_date);
                              },
                            ),
                          ),
                        ),
                        customSpasi(context),
                        CustomEmailWidget(
                            label: "Email :",
                            text: user.email,
                            onChanged: (email) {}),
                        customSpasi(context),
                        CustomTextField(
                            label: "Password :",
                            text: user.password,
                            blurText: true,
                            onChanged: (password) {}),
                        customSpasi(context),
                        CustomNumberField(
                            label: "Nomor Telepon :",
                            text: user.hp,
                            textAlign: TextAlign.left,
                            inputFormat: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (hp) {}),
                        customSpasi(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: CustomNumberField(
                                  label: "Tinggi Badan :",
                                  text: user.height.toString(),
                                  textAlign: TextAlign.center,
                                  inputFormat: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^[0-9,.]*$'))
                                  ],
                                  onChanged: (height) {}),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: CustomNumberField(
                                  label: "Berat Badan :",
                                  text: user.weight.toString(),
                                  textAlign: TextAlign.center,
                                  inputFormat: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^[0-9,.]*$'))
                                  ],
                                  onChanged: (weight) {}),
                            ),
                          ],
                        ),
                        customSpasi(context),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.215),
                          child: ElevatedButton(
                              onPressed: () {
                                String name = user.name;
                                String gender = selectedValue ?? "";
                                String birthDate = _dateController.text;
                                String email = user.email;
                                String password = user.password;
                                String phoneNumber = user.hp;
                                String height = user.height.toString();
                                String weight = user.weight.toString();

                                // Mencetak nilai-nilai tersebut
                                print("Nama: $name");
                                print("Jenis Kelamin: $gender");
                                print("Tanggal Lahir: $birthDate");
                                print("Email: $email");
                                print("Password: $password");
                                print("Nomor Telepon: $phoneNumber");
                                print("Tinggi Badan: $height");
                                print("Berat Badan: $weight");

                                print(
                                    "TRANSGENDER :${UserProfiles.myUser.gender}");
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: themeDark,
                                  foregroundColor: pureWhite,
                                  elevation: 6,
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.0175),
                                  textStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: Text(
                                "Perbarui Profil",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                ),
                              )),
                        ),
                      ],
                      ),
                    )
                  ],
                )
              ],            
            ),
          ),
      ),
    );
  }
}
