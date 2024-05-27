import 'package:e_klinik_pens/pages/common/login_register.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/utils/routes.dart';
import 'package:e_klinik_pens/widgets/common/alert_confirm.dart';
import 'package:e_klinik_pens/widgets/common/button_confirm.dart';
import 'package:e_klinik_pens/widgets/common/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nrpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    Navigator.pushReplacementNamed(context, AppRoutes.logreg);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
        backgroundColor: pureWhite,
        appBar: AppBar(
          leading: Row(
            children: [
              Flexible(
                child: IconButton(
                  iconSize: Checkbox.width,
                  key: const Key('back'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginRegisterPage(),
                      ),
                    );
                  },
                  padding: const EdgeInsets.only(left: 20).w,
                  icon: SvgPicture.asset(
                    "assets/images/back-button.svg",
                    width: 28.w,
                    height: 28.h,
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
          title: Text(
            "Daftar",
            style: TextStyle(
              fontFamily: 'Inter-Semi',
              fontSize: 16.sp,
            ),
          ),
          surfaceTintColor: pureWhite,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0).w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0).w,
                          child: ButtonConfirm(
                            width: 300.w,
                            height: 50.h,
                            text: 'Daftar',
                            colorText: pureWhite,
                            borderColor: themeDark,
                            buttonColor: themeDark,
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                print(
                                    'Name: ${_nameController.text}, NRP/NIP: ${_nrpController.text}, Email: ${_emailController.text}, Password: ${_passwordController.text}');
                              }
                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) {
                              //     return const AlertConfirm(
                              //       descText:
                              //           "Akun anda telah berhasil didaftarkan",
                              //       route: AppRoutes.login,
                              //     );
                              //   },
                              // );
                            },
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
    );
  }
}
