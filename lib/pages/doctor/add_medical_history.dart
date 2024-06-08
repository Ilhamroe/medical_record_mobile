import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TambahRekamMedisPage extends StatefulWidget {
  const TambahRekamMedisPage({super.key});

  @override
  State<TambahRekamMedisPage> createState() => _TambahRekamMedisPageState();
}

class _TambahRekamMedisPageState extends State<TambahRekamMedisPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _symptomsController = TextEditingController();
  final TextEditingController _medicationController = TextEditingController();
  final TextEditingController _diagnosisController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();
  bool isClicked = false;

  String? _selectedName;

  final List<String> _patientNames = [
    '3122500001 - Ade Hafis Rabbani',
    '3122500002 - Nadila Aulia Mirdianti',
    '3122500003 - Zahrotul Hidayah',
    '3122500004 - Denti Widayati',
    '3122500005 - Ari Yoga',
    '3122500020 - Ilham Ramadhani',
    '3122500025 - Rifqi Rayita',
    '3122500030 - Syahrul Ramadhan',
  ];

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5).r,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: pureWhite,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tambah Rekam Medis",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055,
                                color: pureWhite,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 12,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(30).w,
                        topRight: const Radius.circular(30).w,
                      ),
                      color: pureWhite,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 15)
                            .w,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFormRow(
                                context,
                                label: 'Nama:',
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.w)),
                                  ),
                                  value: _selectedName,
                                  items: _patientNames.map((name) {
                                    return DropdownMenuItem(
                                      value: name,
                                      child: Text(name),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedName = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Nama Pasien tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 5.h),
                              _buildFormRow(
                                context,
                                label: 'Tanggal:',
                                child: TextFormField(
                                  controller: _dateController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.w)),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.calendar_today),
                                      onPressed: () => _selectDate(context),
                                    ),
                                  ),
                                  readOnly: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Tanggal tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 5.h),
                              _buildFormRow(
                                context,
                                label: 'Gejala:',
                                child: TextFormField(
                                  maxLines: 4,
                                  controller: _symptomsController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.w)),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Gejala tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 5.h),
                              _buildFormRow(
                                context,
                                label: 'Obat:',
                                child: TextFormField(
                                  controller: _medicationController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.w)),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Obat tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 5.h),
                              _buildFormRow(
                                context,
                                label: 'Diagnosa:',
                                child: TextFormField(
                                  controller: _diagnosisController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.w)),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Diagnosa tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 5.h),
                              _buildFormRow(
                                context,
                                label: 'Kritik & Saran:',
                                child: TextFormField(
                                  maxLines: 4,
                                  controller: _feedbackController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.w)),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Kritik & Saran tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 12.5)
                                        .w,
                                    elevation: 2,
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color(0xFF30ADA2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.w),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Simpan rekam medis
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Rekam medis tersimpan')),
                                      );
                                    }
                                  },
                                  child: Text(
                                    '+ Tambah Rekam Medis',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormRow(BuildContext context,
      {required String label, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            padding: const EdgeInsets.only(top: 15),
            child: Text(label,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
