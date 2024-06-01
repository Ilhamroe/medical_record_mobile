// import 'package:e_klinik_pens/authentication/service_auth.dart';
// import 'package:e_klinik_pens/pages/user/editProfile_page.dart';
// import 'package:e_klinik_pens/pages/user/faq_page.dart';
// import 'package:e_klinik_pens/utils/color.dart';
// import 'package:e_klinik_pens/widgets/profiles/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ProfileTiles extends StatefulWidget {
//     final Widget text;
//     final Widget leading;
//     final Widget trailing;
//     final Function(BuildContext context) onTap;

//   const ProfileTiles({
//     super.key, 
//     required this.text, 
//     required this.leading, 
//     required this.trailing, 
//     required this.onTap
//     });

//   @override
//   State<ProfileTiles> createState() => _ProfileTilesState();
// }

// class _ProfileTilesState extends State<ProfileTiles> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: profileTiles2.length,
//       itemBuilder: (context, index){
//         final profileTile2= profileTiles2[index];
//         return Column(
//           children: [
//             ListTile(
//               title: profileTile2.text,
//               leading: profileTile2.leading,
//               trailing: profileTile2.trailing,
//               onTap: () => profileTile2.onTap(context),
//             ),
//             customDivider(context),
//           ],
//         );
//       }
//     );
//   }
// }
//  final List<ProfileTiles> profileTiles2=[
//     ProfileTiles(
//       text: 
//         Text(
//           "Profil",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16.sp
//             ),
//           ),
//       leading: 
//         const CircleAvatar(
//           backgroundColor: aquaHaze,
//           child: Image(
//             image: AssetImage(
//               "assets/images/profile1.png"), 
//           ),
//         ), 
//       trailing: 
//       Image.asset(
//         "assets/images/arrow.png"
//       ),
//         onTap: (context){
//           Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => EditProfile()
//             ),
//           );
//         },
//     ),
//     ProfileTiles(
//       text: 
//         Text("FAQ", 
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16.sp
//             ),
//           ), 
//       leading: 
//         const CircleAvatar(
//           backgroundColor: aquaHaze,
//           child: Image(
//             image: AssetImage(
//               "assets/images/faq.png"
//             ),
//            ),
//           ), 
//       trailing: Image.asset(
//         "assets/images/arrow.png"
//       ), 
//       onTap: (context) {
//         Navigator.push(
//           context, 
//           MaterialPageRoute(builder: (context) => const FaqPage()
//           )
//         );
//       },
//     ),
//     ProfileTiles(
//       text: 
//         Text(
//           "Keluar", 
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16.sp,
//             color: danger
//             )
//           ), 
//       leading: 
//         const CircleAvatar(
//           backgroundColor: aquaHaze,
//           child: Image(
//             image: AssetImage(
//               "assets/images/exit.png"
//             ),
//           )
//         ), 
//       trailing: Image.asset(
//         "assets/images/arrow.png"
//       ),
//       onTap: (context) {
//           final ServiceAuth _logoutService = ServiceAuth();
//         _logoutService.logoutUser(context);
//       },
//     ),
//   ];