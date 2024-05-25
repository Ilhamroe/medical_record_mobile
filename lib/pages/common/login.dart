import 'package:e_klinik_pens/pages/common/login_register.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/utils/routes.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomFormField(
                                width: 300.w,
                                height: 50.h,
                                placeholder: 'Masukkan email Anda',
                                leadingIcon: 'assets/images/email.png',
                                controller: _emailController,
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
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 15.0).w,
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
                            padding: const EdgeInsets.symmetric(vertical: 5.0).w,
                            child: ButtonConfirm(
                              width: 300.w,
                              height: 50.h,
                              text: 'Masuk',
                              colorText: pureWhite,
                              borderColor: themeDark,
                              buttonColor: themeDark,
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  print(
                                      'Email: ${_emailController.text}, Password: ${_passwordController.text}');
                                }
                              },
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
                              Navigator.pushNamed(context, AppRoutes.register);
                            },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
