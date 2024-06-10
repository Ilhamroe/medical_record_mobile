import 'package:e_klinik_pens/authentication/service_auth.dart';
import 'package:e_klinik_pens/models/users.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/utils/routes.dart';
import 'package:e_klinik_pens/widgets/common/alert_danger.dart';
import 'package:e_klinik_pens/widgets/common/alert_success.dart';
import 'package:e_klinik_pens/widgets/common/button_confirm.dart';
import 'package:e_klinik_pens/widgets/common/custom_edit_profiles.dart';
import 'package:e_klinik_pens/widgets/common/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditAkun extends StatefulWidget {
  final String userId;
  const EditAkun({super.key, required this.userId,
  });

  @override
  State<EditAkun> createState() => _EditAkunState();
}

class _EditAkunState extends State<EditAkun> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nrpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final ServiceAuth _updateService = ServiceAuth();
  bool _isLoading = false;
  String? selectedValue;
  User? _user;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    // final userId = prefs.getInt('userId');
    final userId = int.tryParse(widget.userId);

    if (userId != null) {
      try {
        final user = await _updateService.getUserById(userId);
        setState(() {
          _user = user;
          _nameController.text = _user?.name ?? "";
          _nrpController.text = _user?.nrp ?? "";
          _emailController.text = _user?.email ?? "";
          _passwordController.text = _user?.password ?? "";
          _roleController.text = _user?.role ?? "";
          _descriptionController.text = _user?.description ?? "";
        });
      } catch (e) {
        print('Failed to load user data: $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
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
      'password': _passwordController.text,
      'role': selectedValue ?? _roleController.text,
      'description': _descriptionController.text,
    };
    try {
      await _updateService.updateUserData(userData, _user!.id);
      print('Profile berhasil diperbarui!');
      _showDialog(const AlertConfirm(
        titleText: "Sukses",
        descText: "Akun anda telah berhasil diperbarui",
        route: AppRoutes.navbarAdmin,
        confirmText: 'Tutup',
      ));
    } catch (e) {
      print('Gagal memperbarui profile: $e');
      _showDialog(const AlertDanger(
        titleText: "Gagal",
        descText: "Akun anda gagal untuk diperbarui, Cek koneksi internetmu",
      ));
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

  @override
  void dispose() {
    _nameController.dispose();
    _nrpController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _roleController.dispose();
    _descriptionController.dispose();
    super.dispose();
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
              "Edit Akun",
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
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0), 
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            FormField<String>(
                              validator: (value) {
                                if (_nameController.text.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              builder: (FormFieldState<String> field) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomFormField(
                                      width: 300.w,
                                      height: 50.h,
                                      placeholder: 'Masukkan nama Anda',
                                      leadingIcon: 'assets/images/id.png',
                                      controller: _nameController,
                                    ),
                                    if (field.hasError)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 2.0)
                                            .w,
                                        child: Text(
                                          field.errorText ?? '',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            FormField<String>(
                              validator: (value) {
                                if (_nrpController.text.isEmpty) {
                                  return 'Please enter your NRP/NIP';
                                }
                                return null;
                              },
                              builder: (FormFieldState<String> field) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomFormField(
                                      width: 300.w,
                                      height: 50.h,
                                      placeholder: 'Masukkan NRP/NIP Anda',
                                      leadingIcon: 'assets/images/nrp.png',
                                      controller: _nrpController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                    ),
                                    if (field.hasError)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 2.0)
                                            .w,
                                        child: Text(
                                          field.errorText ?? '',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            FormField<String>(
                              validator: (value) {
                                if (_emailController.text.isEmpty) {
                                  return 'Please enter your email';
                                }
                                String pattern =
                                    r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                                RegExp regex = RegExp(pattern);
                                if (!regex.hasMatch(_emailController.text)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              builder: (FormFieldState<String> field) {
                                bool isValid = false;
                                if (_emailController.text.isNotEmpty) {
                                  String pattern =
                                      r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                                  RegExp regex = RegExp(pattern);
                                  if (regex.hasMatch(_emailController.text)) {
                                    isValid = true;
                                  }
                                }
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomFormField(
                                      width: 300.w,
                                      height: 50.h,
                                      placeholder: 'Masukkan email Anda',
                                      leadingIcon: 'assets/images/email.png',
                                      controller: _emailController,
                                      trailing: isValid
                                          ? SvgPicture.asset(
                                              'assets/images/done.svg',
                                              color: themeDark,
                                            )
                                          : null,
                                    ),
                                    if (field.hasError)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 2.0)
                                            .w,
                                        child: Text(
                                          field.errorText ?? '',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            FormField<String>(
                              validator: (value) {
                                if (_passwordController.text.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (_passwordController.text.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              builder: (FormFieldState<String> field) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomFormField(
                                      width: 300.w,
                                      height: 50.h,
                                      placeholder: 'Masukkan password Anda',
                                      leadingIcon: 'assets/images/pw.png',
                                      trailingIcon: Icons.visibility,
                                      controller: _passwordController,
                                      obscureText: true,
                                    ),
                                    if (field.hasError)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 2.0)
                                            .w,
                                        child: Text(
                                          field.errorText ?? '',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            FormField<String>(
                              validator: (value) {
                                if (selectedValue == null) {
                                  return 'Please select a role';
                                }
                                return null;
                              },
                              builder: (FormFieldState<String> field) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomProfilesField(
                                      width: 300.w,
                                      height: 50.h,
                                      placeholder: "Masukkan role Anda",
                                      controller: _roleController,
                                      keyboardType: TextInputType.none,
                                      readOnly: true,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      trailingIcon: Icons.arrow_drop_down,
                                      dropdownItems: [
                                        "Admin",
                                        "Dokter",
                                        "User"
                                      ],
                                      onChangedDropdown: (String? value) {
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                    if (field.hasError)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 2.0)
                                            .w,
                                        child: Text(
                                          field.errorText ?? '',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            FormField<String>(
                              builder: (FormFieldState<String> field) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomFormField(
                                      width: 300.w,
                                      height: 50.h,
                                      placeholder: 'Masukkan deskripsi Anda',
                                      leadingIcon: 'assets/images/desc.png',
                                      controller: _descriptionController,
                                    ),
                                    if (field.hasError)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 2.0)
                                            .w,
                                        child: Text(
                                          field.errorText ?? '',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0).w,
                              child: ButtonConfirm(
                                width: 300.w,
                                height: 50.h,
                                text: 'Perbarui Akun',
                                colorText: pureWhite,
                                borderColor: themeDark,
                                buttonColor: themeDark,
                                onPressed: _updateData,
                              ),
                            ),
                          ],
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
}
