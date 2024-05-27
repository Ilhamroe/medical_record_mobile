import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TambahAkun extends StatefulWidget {
  const TambahAkun({Key? key}) : super(key: key);

  @override
  State<TambahAkun> createState() => _TambahAkunState();
}

class _TambahAkunState extends State<TambahAkun> {
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
              "Tambah Akun",
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
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding inside the container
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25), // Set border radius
                            borderSide: BorderSide(),
                          ),
                          hintStyle: TextStyle(color: Color.fromRGBO(161, 168, 176, 1)),
                          prefixIcon: Image.asset('assets/images/user.png', width: 20, height: 20),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan NRP/NIP',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25), // Set border radius
                            borderSide: BorderSide(),
                          ),
                          hintStyle: TextStyle(color: Color.fromRGBO(161, 168, 176, 1)),
                          prefixIcon: Image.asset('assets/images/password.png', width: 20, height: 20),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25), // Set border radius
                            borderSide: BorderSide(),
                          ),
                          hintStyle: TextStyle(color: Color.fromRGBO(161, 168, 176, 1)),
                          prefixIcon: Image.asset('assets/images/Email.png', width: 20, height: 20),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25), // Set border radius
                            borderSide: BorderSide(),
                          ),
                          hintStyle: TextStyle(color: Color.fromRGBO(161, 168, 176, 1)),
                          prefixIcon: Image.asset('assets/images/lock.png', width: 20, height: 20),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off,
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
                      ),
                      SizedBox(height: 16),
                    InputDecorator(
                        decoration: InputDecoration(
                          hintText: 'Masukkan role', // Teks hint
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25), // Set border radius
                            borderSide: BorderSide(),
                          ),
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Image.asset('assets/images/Group.png', width: 20, height: 20),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          isDense: true,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            value: _selectedRole,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedRole = newValue;
                              });
                            },
                            items: [
                               DropdownMenuItem<String>(
                                value: 'Pasien',
                                child: Text(
                                  'Pasien',
                                  style: TextStyle(
                                    color: Color.fromRGBO(173, 173, 173, 1),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                enabled: false,
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 4.0),
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Dokter',
                                child: Text(
                                  'Dokter',
                                  style: TextStyle(
                                    color: Color.fromRGBO(173, 173, 173, 1),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                            decoration: InputDecoration.collapsed(hintText: 'Masukkan role'),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Add your form submission logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(48, 173, 162, 1), // Contoh warna RGB
                          shape: StadiumBorder(),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        ),
                        child: Text(
                          'Buat Akun',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white, // Warna teks
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
}
