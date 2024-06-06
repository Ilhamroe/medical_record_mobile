import 'package:e_klinik_pens/authentication/service_auth.dart';
import 'package:e_klinik_pens/authentication/service_clinic.dart';
import 'package:e_klinik_pens/models/users.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/utils/routes.dart';
import 'package:e_klinik_pens/widgets/common/alert_danger.dart';
import 'package:e_klinik_pens/widgets/common/alert_success.dart';
import 'package:e_klinik_pens/widgets/common/button_confirm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final ServiceClinic _clinicService = ServiceClinic();
  bool _isLoading = false;
  String? _selectedName;
  User? _user;

  List<String> _patientNames = [];
  List<User> _users = [];

  Future<void> _loadPatientNames() async {
    try {
      final patients = await ServiceAuth().getAllUsers();
      print('Loaded users: $patients');

      setState(() {
        _users = patients.where((user) => user.role == 'user').toList();
        _patientNames = _users.map((user) => '${user.nrp} - ${user.name}').toList();
      });
    } catch (e) {
      print('Failed to load users: $e');
    }
  }

  void _addData() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      final selectedNameIndex = _patientNames.indexOf(_selectedName ?? '');

      if (selectedNameIndex != -1) {
        final selectedPatient = _users[selectedNameIndex];
        final userData = {
          'doctor_id': _user?.id,
          'patient_id': selectedPatient.id,
          'symptom': _symptomsController.text,
          'dated': _dateController.text,
          'diagnosis': _diagnosisController.text,
          'drug': _medicationController.text,
          'advice': _feedbackController.text,
        };

        print('$userData');

        try {
          final response = await _clinicService.clinicStore(userData);
          print('successful: $response');
          _showDialog(const AlertConfirm(
            titleText: "Sukses",
            descText: "Anda telah berhasil menambahkan rekam medis",
            route: AppRoutes.navbarDokter,
            confirmText: 'Tutup',
          ));
        } catch (e) {
          print('Registration failed: $e');
          _showDialog(const AlertDanger(
            titleText: "Gagal",
            descText: "Gagal untuk menambahkan data, Cek koneksi internetmu",
          ));
        } finally {
          setState(() {
            _isLoading = false;
          });
        }
      } else {
        print('Selected name not found in the list');
      }
    }
  }

  void _showDialog(Widget dialog) {
    showDialog(
      context: context,
      builder: (BuildContext context) => dialog,
    ).then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

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
  void dispose() {
    _selectedName = null;
    _dateController.dispose();
    _symptomsController.dispose();
    _medicationController.dispose();
    _diagnosisController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadPatientNames();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');

    if (userId != null) {
      try {
        final user = await ServiceAuth().getUserById(userId);
        setState(() {
          _user = user;
        });
      } catch (e) {
        print('Failed to load user data: $e');
      }
    } else {
      print('User ID not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: Column(
        children: [
          Container(
            color: themeLight,
            child: SafeArea(
              child: Column(
                children: [
                  Row(
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
                      Expanded(
                        child: Text(
                          "Tambah Rekam Medis",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: pureWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   height: MediaQuery.of(context).size.height * 0.105,
                  //   decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage("assets/images/atom.png"),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  Container(
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
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0).w,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormRow(
                        context,
                        label: 'Nama:',
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
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
                      const SizedBox(height: 5),
                      _buildFormRow(
                        context,
                        label: 'Tanggal:',
                        child: TextFormField(
                          controller: _dateController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
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
                      const SizedBox(height: 5),
                      _buildFormRow(
                        context,
                        label: 'Gejala:',
                        child: TextFormField(
                          maxLines: 4,
                          controller: _symptomsController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Gejala tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      _buildFormRow(
                        context,
                        label: 'Obat:',
                        child: TextFormField(
                          controller: _medicationController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Obat tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      _buildFormRow(
                        context,
                        label: 'Diagnosa:',
                        child: TextFormField(
                          controller: _diagnosisController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Diagnosa tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      _buildFormRow(
                        context,
                        label: 'Kritik & Saran:',
                        child: TextFormField(
                          maxLines: 4,
                          controller: _feedbackController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kritik & Saran tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0).w,
                          child: ButtonConfirm(
                            width: 160.w,
                            height: 40.h,
                            text: 'Tambah data',
                            borderRadius: 16.0.w,
                            colorText: pureWhite,
                            borderColor: themeDark,
                            buttonColor: themeDark,
                            onPressed: _addData,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormRow(BuildContext context,
      {required String label, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0).w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.0.w,
            padding: const EdgeInsets.only(top: 15).r,
            child: Text(label, style: TextStyle(fontSize: 16.sp)),
          ),
          SizedBox(width: 3),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
