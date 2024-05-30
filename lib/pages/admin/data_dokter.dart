import 'package:e_klinik_pens/models/doctor_data.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataDokter extends StatefulWidget {
  const DataDokter({super.key});

  @override
  State<DataDokter> createState() => _DataDokterState();
}

class _DataDokterState extends State<DataDokter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: themeLight,
            leading: Padding(
              padding: const EdgeInsets.only(left: 12.0).r,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: pureWhite,
                ),
              ),
            ),
            title: Text(
              "Data Dokter",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.055,
                color: pureWhite,
              ),
            ),
            centerTitle: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.115,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/atomic.png",
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.0275,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: pureWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10).w,
              child: SizedBox(
                width: 0, // Adjust the width as needed
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(250, 250, 250, 1), // Using RGB values
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10), // Adjust the padding
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromRGBO(26, 154, 142, 1), // Set the color of the icon
                      ),
                      hintText: "Cari nama dokter",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(171, 171, 171, 1),
                        fontSize: 16,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final doctordata= doctorsData[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 5).r,
                      child: Card(
                        surfaceTintColor: Colors.transparent,
                        color: pureWhite,
                        elevation: 5,
                        child: ListTile(
                          leading: Image.asset(doctordata.profilePhoto),
                          title: Text(doctordata.name, style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold
                          ),),
                          subtitle: Text(doctordata.role, style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        trailing: Text(
                          doctordata.exp, 
                          style: TextStyle(
                            fontSize: 12.sp
                          ),
                        ),
                        ),
                      ),
                    )
                  ],
                );
              },
              childCount: doctorsData.length,
            ),
          ),
        ],
      ),
    );
  }
}
