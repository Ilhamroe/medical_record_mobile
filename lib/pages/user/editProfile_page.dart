import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/user/profile.dart';
import 'package:e_klinik_pens/widgets/common/button_confirm.dart';
import 'package:e_klinik_pens/widgets/common/custom_edit_profiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_klinik_pens/models/users.dart';
import 'package:e_klinik_pens/authentication/service_auth.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nrpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  User? _user;
  final ServiceAuth _serviceAPI = ServiceAuth();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');

    if (userId != null) {
      try {
        final user = await _serviceAPI.getUserById(userId);
        setState(() {
          _user = user;
          _nameController.text = _user?.name ?? "";
          _nrpController.text = _user?.nrp ?? "";
          _emailController.text = _user?.email ?? "";
          _genderController.text = _user?.gender ?? "";
          _dateController.text = _user?.birth ?? "";
          _numberController.text = _user?.number ?? "";
          _heightController.text = _user?.height?.toString() ?? "";
          _weightController.text = _user?.weight?.toString() ?? "";
        });
      } catch (e) {
        print('Failed to load user data: $e');
      }
    } else {
      print('User ID not found');
    }
  }

  void _updateData() async {
    Map<String, dynamic> userData = {
      'name': _nameController.text,
      'nrp': _nrpController.text,
      'email': _emailController.text,
      'gender': selectedValue ?? _genderController.text,
      'birth': _dateController.text,
      'number': _numberController.text,
      'height': double.tryParse(_heightController.text) ?? 0.0,
      'weight': double.tryParse(_weightController.text) ?? 0.0,
    };
    try {
      await _serviceAPI.updateUserData(userData, _user!.id);
      print('Profile berhasil diperbarui!');
    } catch (e) {
      print('Gagal memperbarui profile: $e');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nrpController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dateController.dispose();
    _numberController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
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
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 16),
                      child: Container(),
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
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        children: [
                          customSpasi(context),
                          const TextLabel(label: 'Nama:'),
                          CustomProfilesField(
                            width: 300.w,
                            height: 50.h,
                            placeholder: "Masukkan nama Anda",
                            controller: _nameController,
                          ),
                          const TextLabel(label: 'NRP/NIP:'),
                          CustomProfilesField(
                            width: 300.w,
                            height: 50.h,
                            placeholder: "Masukkan NRP/NIP Anda",
                            controller: _nrpController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          const TextLabel(label: 'Email:'),
                          CustomProfilesField(
                            width: 300.w,
                            height: 50.h,
                            placeholder: "Masukkan email Anda",
                            controller: _emailController,
                          ),
                          const TextLabel(label: 'Password:'),
                          CustomProfilesField(
                            width: 300.w,
                            height: 50.h,
                            placeholder: "*********",
                            controller: _passwordController,
                            keyboardType: TextInputType.none,
                            readOnly: true,
                          ),
                          const TextLabel(label: 'Jenis Kelamin:'),
                          CustomProfilesField(
                            width: 300.w,
                            height: 50.h,
                            placeholder: "Masukkan jenis kelamin Anda",
                            controller: _genderController,
                            keyboardType: TextInputType.none,
                            readOnly: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            trailingIcon: Icons.arrow_drop_down,
                            dropdownItems: ["Laki-laki", "Perempuan"],
                            onChangedDropdown: (String? value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                          const TextLabel(label: 'Tanggal Lahir:'),
                          CustomProfilesField(
                            width: 300.w,
                            height: 50.h,
                            placeholder: "Masukkan tanggal lahir Anda",
                            controller: _dateController,
                            trailingIcon: Icons.calendar_today,
                            keyboardType: TextInputType.none,
                            readOnly: true,
                          ),
                          const TextLabel(label: 'Nomor Telepon:'),
                          CustomProfilesField(
                            width: 300.w,
                            height: 50.h,
                            placeholder: "Masukkan nomor telepon Anda",
                            controller: _numberController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextLabel(label: 'Tinggi Badan:'),
                                      ],
                                    ),
                                    CustomProfilesField(
                                      width: 300.w,
                                      height: 50.h,
                                      placeholder: "-",
                                      controller: _heightController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextLabel(label: 'Berat Badan:'),
                                      ],
                                    ),
                                    CustomProfilesField(
                                      width: 300.w,
                                      height: 50.h,
                                      placeholder: "-",
                                      controller: _weightController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 20.0).w,
                            child: ButtonConfirm(
                              width: 160.w,
                              height: 40.h,
                              text: 'Perbarui profile',
                              borderRadius: 16.0.w,
                              colorText: pureWhite,
                              borderColor: themeDark,
                              buttonColor: themeDark,
                              onPressed: _updateData, //arahkan dan buat fungsi update data
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
