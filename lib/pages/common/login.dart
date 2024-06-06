import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:e_klinik_pens/authentication/service_auth.dart';
import 'package:e_klinik_pens/pages/common/login_register.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/utils/routes.dart';
import 'package:e_klinik_pens/widgets/common/alert_success.dart';
import 'package:e_klinik_pens/widgets/common/alert_danger.dart';
import 'package:e_klinik_pens/widgets/common/button_confirm.dart';
import 'package:e_klinik_pens/widgets/common/custom_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ServiceAuth _loginService = ServiceAuth();
  bool _isLoading = false;

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    Navigator.pushReplacementNamed(context, AppRoutes.logreg);
    return false;
  }

  void _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      print('Email: $email');
      print('Password: $password');

      final userData = {
        'email': email,
        'password': password,
      };

      try {
        final response = await _loginService.loginUser(userData);
        print('Login successful: $response');

        if (response.containsKey('user') &&
            response['user'].containsKey('role')) {
          String userRole = response['user']['role'];
          _showRoleBasedDialog(userRole);
        } else {
          throw Exception('Invalid response structure');
        }
      } catch (e) {
        print('Login failed: $e');

        String errorMessage =
            'Login failed. Please check your credentials and try again.';
        if (e is DioError) {
          if (e.response != null) {
            if (e.response?.statusCode == 422) {
              errorMessage = 'Invalid email or password.';
            } else {
              errorMessage = 'Error: ${e.response?.statusMessage}';
            }
          } else {
            errorMessage = 'Connection error: ${e.message}';
          }
        }

        _showErrorDialog(errorMessage);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showRoleBasedDialog(String userRole) {
    Widget dialog;
    switch (userRole) {
      case 'admin':
        dialog = const AlertConfirm(
          titleText: "Sukses",
          descText: "Akun anda telah berhasil login",
          route: AppRoutes.navbarAdmin,
          confirmText: 'Tutup',
        );
        break;
      case 'dokter':
        dialog = const AlertConfirm(
          titleText: "Sukses",
          descText: "Akun anda telah berhasil login",
          route: AppRoutes.navbarDokter,
          confirmText: 'Tutup',
        );
        break;
      case 'user':
        dialog = const AlertConfirm(
          titleText: "Sukses",
          descText: "Akun anda telah berhasil login",
          route: AppRoutes.navbarUser,
          confirmText: 'Tutup',
        );
        break;
      default:
        dialog = const AlertDanger(
          titleText: "Gagal",
          descText: "Anda tidak memiliki hak akses yang valid.",
        );
    }
    _showDialog(dialog);
  }

  void _showErrorDialog(String errorMessage) {
    _showDialog(AlertDanger(
      titleText: "Gagal",
      descText: errorMessage,
    ));
  }

  void _showDialog(Widget dialog) {
    showDialog(
      context: context,
      builder: (BuildContext context) => dialog,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
            "Masuk",
            style: TextStyle(
              fontFamily: 'Inter-Semi',
              fontSize: 16.sp,
            ),
          ),
          surfaceTintColor: pureWhite,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                          top: 10.0, bottom: 15.0)
                                      .w,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.popAndPushNamed(
                                          context, AppRoutes.resetpw);
                                    },
                                    child: Text(
                                      'Lupa Password?',
                                      style: TextStyle(
                                          fontFamily: 'Inter-Regular',
                                          fontSize: 15.sp,
                                          color: themeDark),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0)
                                          .w,
                                  child: ButtonConfirm(
                                    width: 300.w,
                                    height: 50.h,
                                    text: 'Masuk',
                                    colorText: pureWhite,
                                    borderColor: themeDark,
                                    buttonColor: themeDark,
                                    onPressed: _login,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0).w,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Belum memiliki akun? ",
                                style: TextStyle(
                                  fontFamily: 'Inter-Regular',
                                  fontSize: 15.sp,
                                  color: textColor,
                                ),
                              ),
                              TextSpan(
                                text: "Daftar",
                                style: TextStyle(
                                  fontFamily: 'Inter-Regular',
                                  fontSize: 15.sp,
                                  color: themeDark,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, AppRoutes.register);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_isLoading)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
