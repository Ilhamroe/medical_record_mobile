import 'package:e_klinik_pens/models/user.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/pages/user/editProfile_page.dart';
import 'package:e_klinik_pens/pages/user/faq_page.dart';
import 'package:e_klinik_pens/pages/user/medical_record_history.dart';
import 'package:e_klinik_pens/utils/user_profiles.dart';
import 'package:e_klinik_pens/widgets/common/exit_modals.dart';
import 'package:flutter/material.dart';
import 'package:e_klinik_pens/widgets/profiles/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user= UserProfiles.myUser;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => ExitModals.onBackButtonPressed(context),
      child: Scaffold(
        body: Container(
          color: themeLight,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/atomic.png"),
              ),
              Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.239,
                        height: MediaQuery.of(context).size.height * 0.113,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: AssetImage("assets/images/profiles-pic.jpg")
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.025,
                      ),
                      Text(
                        user.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Image(image: AssetImage("assets/images/height.png"), width: 28, height: 43,),
                              const Text("Tinggi Badan", style: TextStyle(color: mintTulip),),
                              Text(user.height.toString(), style: TextStyle(color: pureWhite, fontWeight: FontWeight.bold, fontSize: 18),)
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 44,
                            color: mintTulip,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                          ),
                          Column(
                            children: [
                              const Image(image: AssetImage("assets/images/weight.png"), width: 28, height: 44,),
                              const Text("Berat Badan", style: TextStyle(color: mintTulip)),
                              Text(user.weight.toString(), style: TextStyle(color: pureWhite, fontWeight: FontWeight.bold, fontSize: 18),)
                            ],
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
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView(
                    children:<Widget> [
                      ListTile(
                        title: const Text(
                          "Profil",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        leading: const CircleAvatar(
                          backgroundColor: aquaHaze,
                          child: Image(image: AssetImage("assets/images/profile.png")),
                          ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: MediaQuery.of(context).size.width * 0.05,
                          ),
                        iconColor: emperor,
                        onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditProfile()
                            ),
                          );
                        },
                      ),
                    customDivider(context),
                      ListTile(
                        title: const Text("FAQ", style: TextStyle(fontWeight: FontWeight.bold)),
                        leading: const CircleAvatar(
                          backgroundColor: aquaHaze,
                          child: Image(image: AssetImage("assets/images/faq.png"))),
                        trailing: Icon(Icons.arrow_forward_ios_rounded, size: MediaQuery.of(context).size.width * 0.05),
                        iconColor: emperor,
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => const FaqPage()
                            )
                          );
                        },
                      ),
                      customDivider(context),
                        ListTile(
                        title: const Text("Keluar", style: TextStyle(fontWeight: FontWeight.bold)),
                        textColor: danger,
                        leading: const CircleAvatar(
                          backgroundColor: aquaHaze,
                          child: Image(image: AssetImage("assets/images/exit.png"))),
                        trailing: Icon(Icons.arrow_forward_ios_rounded, size: MediaQuery.of(context).size.width * 0.05),
                        iconColor: emperor,
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => MedicalHistory()
                            )
                          );
                        },
                      ),
                      customDivider(context)
                    ],
                  ),
                ),
              ],
            ),          
            ],     
          ),
        ),
      ),
    );
  }
  
}