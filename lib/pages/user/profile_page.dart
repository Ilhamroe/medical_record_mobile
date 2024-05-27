import 'package:e_klinik_pens/models/homepages_tile.dart';
import 'package:e_klinik_pens/models/user.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/utils/user_profiles.dart';
import 'package:e_klinik_pens/widgets/common/exit_modals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 75).r,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 85.w,
                          height: 85.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image(
                              image: AssetImage("assets/images/profiles-pic.jpg")
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0).w,
                          child: Text(
                            user.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Image(
                                  image: const AssetImage(
                                    "assets/images/height.png"), 
                                    width: 23.5.w, 
                                    height: 38.5.h,
                                  ),
                                const Text(
                                  "Tinggi Badan", 
                                  style: TextStyle(
                                    color: mintTulip
                                    ),
                                  ),
                                Text(
                                  user.height.toString(), 
                                  style: TextStyle(
                                    color: pureWhite, 
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 18.sp
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 1,
                              height: 44.sp,
                              color: mintTulip,
                              margin: const EdgeInsets.symmetric(horizontal: 17.5).w,
                            ),
                            Column(
                              children: [
                                Image(
                                  image: const AssetImage(
                                    "assets/images/weight.png"), 
                                    width: 23.5.w, 
                                    height: 38.5.h,
                                  ),
                                const Text(
                                  "Berat Badan", 
                                  style: TextStyle(
                                    color: mintTulip
                                    ),
                                  ),
                                Text(
                                  user.weight.toString(), 
                                  style: TextStyle(
                                    color: pureWhite, 
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 18.sp
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                 Expanded(
                  flex: 6,
                   child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(25).w,
                        topRight: const Radius.circular(25).w
                      ),
                      color: pureWhite,
                    ),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: profileTiles.length,
                      itemBuilder: (context, index){
                        final profileTile= profileTiles[index];
                        return Column(
                          children: [
                            ListTile(
                              title: profileTile.text,
                              leading: profileTile.leading,
                              trailing: profileTile.trailing,
                              onTap: () => profileTile.onTap(context),
                            ),
                            customDivider(context),
                          ],
                        );
                      }
                    ),
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