import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditAkun extends StatefulWidget {
  const EditAkun({super.key});

  @override
  State<EditAkun> createState() => _EditAkunState();
}

class _EditAkunState extends State<EditAkun> {
  bool _isObscure = true;
  String? _selectedRole;

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
                      horizontal: 16.0), // Add padding inside the container
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan username',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(25), // Set border radius
                            borderSide: BorderSide(),
                          ),
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(161, 168, 176, 1)),
                          prefixIcon: Image.asset('assets/images/user.png',
                              width: 20, height: 20),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan NRP/NIP',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(25), // Set border radius
                            borderSide: BorderSide(),
                          ),
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(161, 168, 176, 1)),
                          prefixIcon: Image.asset('assets/images/password.png',
                              width: 20, height: 20),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan email',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(25), // Set border radius
                            borderSide: BorderSide(),
                          ),
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(161, 168, 176, 1)),
                          prefixIcon: Image.asset('assets/images/email.png',
                              width: 20, height: 20),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email tidak boleh kosong";
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Masukkan email yang valid';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan password',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(25), // Set border radius
                            borderSide: BorderSide(),
                          ),
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(161, 168, 176, 1)),
                          prefixIcon: Image.asset('assets/images/lock.png',
                              width: 20, height: 20),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        ),
                        obscureText: _isObscure,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password harus diisi';
                          }
                          if (value.length < 6) {
                            return 'Password minimal 6 karakter';
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField(
                          value: _selectedRole,
                          decoration: InputDecoration(
                              hintText: "Masukkan Role",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    25), // Set border radius
                                borderSide: BorderSide(),
                              ),
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(161, 168, 176, 1)),
                              prefixIcon:
                                  Image.asset("assets/images/Group.png")),
                          items: ["Pasien", "Dokter"].map((String e) {
                            return DropdownMenuItem<String>(
                                value: e, child: Text(e));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _selectedRole = value;
                            });
                          }),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Add your form submission logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(
                              48, 173, 162, 1), // Contoh warna RGB
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16)
                              .w,
                        ),
                        child: Text(
                          'Edit Akun',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: pureWhite),
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
