import 'package:e_klinik_pens/models/patient_list.dart'; // Assuming you have a similar model for patient data
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';

class DataPasien extends StatefulWidget {
  const DataPasien({Key? key}) : super(key: key);

  @override
  State<DataPasien> createState() => _DataPasienState();
}

class _DataPasienState extends State<DataPasien> {
  List<Patient> patientLists = PatientContents.patientLists;
  List<Patient> filteredPatientLists = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredPatientLists = patientLists;
    searchController.addListener(_filterPatients);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterPatients);
    searchController.dispose();
    super.dispose();
  }

  void _filterPatients() {
    String searchText = searchController.text.toLowerCase();
    setState(() {
      filteredPatientLists = patientLists.where((patient) {
        return patient.name.toLowerCase().contains(searchText) ||
            patient.nrp.toLowerCase().contains(searchText);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: themeLight,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: pureWhite,
              ),
            ),
            title: Text(
              "Pasien",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.055,
                color: pureWhite,
              ),
            ),
            centerTitle: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.155,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/atom.png",
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
              padding: const EdgeInsets.only(
                top: 2.0,
                right: 25.0,
                left: 25.0,
                bottom: 0,
              ),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: pureWhite,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Color(0xFFF7F7F7)),
                  ),
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Cari nama pasien/NRP pasien',
                      hintStyle: TextStyle(color: Color(0xFFABABAB)),
                      prefixIcon: Icon(Icons.search, color: Color(0xFF1A9A8E)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 15.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: ListView.builder(
              itemCount: filteredPatientLists.length,
              itemBuilder: (BuildContext context, int index) {
                Patient patient = filteredPatientLists[index];
                return Card(
                  margin: const EdgeInsets.only(
                    top: 0,
                    right: 25.0,
                    left: 25.0,
                    bottom: 14.0,
                  ),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/nopic.png'),
                      backgroundColor: Colors.white,
                    ),
                    title: Text(
                      patient.name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(patient.nrp),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
