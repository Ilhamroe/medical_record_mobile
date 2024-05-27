import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sukses extends StatefulWidget {
  const Sukses({super.key});

  @override
  State<Sukses> createState() => _SuksesState();
}

class _SuksesState extends State<Sukses> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Show Alert Dialog'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Container(
                      // Menetapkan lebar Container
                      padding: EdgeInsets.all(
                          20), // Menambahkan padding ke Container
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: Color.fromRGBO(48, 173, 162, 1),
                          ),
                          vertical: BorderSide(
                            color: Color.fromRGBO(48, 173, 162, 1),
                            width: 50, // Lebar border vertikal
                          ),
                        ),
                        color: Color.fromRGBO(48, 173, 162,
                            1), // Warna isi sama dengan warna border
                        borderRadius: BorderRadius.circular(
                            50), // Mengatur border menjadi berbentuk bundar
                      ),
                      child: Text(
                        'Tutup',
                        style: TextStyle(
                          color: Colors.white, // Warna teks
                          fontWeight: FontWeight.bold, // Ketebalan teks
                          fontSize: 20, // Ukuran font
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              icon: Image.asset('assets/images/Done.png',
                  width: 150, height: 150),
              title: Center(
                child: Text(
                  'Sukses',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
              content: Center(
                child: Text(
                  'Akun telah berhasil ditambahkan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(
                        161, 168, 176, 1), // Menetapkan warna teks menjadi biru
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
