import 'package:e_klinik_pens/models/patients_data.dart';
import 'package:e_klinik_pens/pages/admin/edit_akun.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataPasien extends StatefulWidget {
  const DataPasien({super.key});

  @override
  State<DataPasien> createState() => _DataPasienState();
}

class _DataPasienState extends State<DataPasien> {
  List<PatientData> _allPatients = patientsData;
  List<PatientData> _filteredPatients = patientsData;
  String _searchMessage = '';

  void _runFilter(String enteredKeyword) {
    List<PatientData> results;
    if (enteredKeyword.isEmpty) {
      results = _allPatients;
      _searchMessage = '';
    } else {
      results = _allPatients
          .where((patient) => patient.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      if (results.isNotEmpty) {
        _searchMessage = '';
      } else {
        _searchMessage = 'Tidak Ada Pasien Bernama: "$enteredKeyword"';
      }
    }

    setState(() {
      _filteredPatients = results;
    });
  }

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
              "Data Pasien",
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
                    onChanged: (value) => _runFilter(value),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10), // Adjust the padding
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromRGBO(26, 154, 142, 1), // Set the color of the icon
                      ),
                      hintText: "Cari nama pasien",
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
          SliverToBoxAdapter(
            child: _searchMessage.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20).w,
                    child: Center(
                      child: Text(
                        _searchMessage,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final patientData = _filteredPatients[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 5).r,
                      child: Card(
                        surfaceTintColor: Colors.transparent,
                        color: pureWhite,
                        elevation: 5,
                        child: ListTile(
                          leading: Image.asset(patientData.profilePhoto),
                          title: Text(
                            patientData.name,
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            patientData.nrp,
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => EditAkun()),
                                  );
                                },
                                child: Image.asset(
                                  patientData.trailing1,
                                  width: 35.w,
                                  height: 35.w,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Image.asset(
                                patientData.trailing2,
                                width: 35.w,
                                height: 35.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              childCount: _filteredPatients.length,
            ),
          ),
        ],
      ),
    );
  }
}

