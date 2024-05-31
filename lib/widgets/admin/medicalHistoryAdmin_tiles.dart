import 'package:flutter/material.dart';

class MedicalHistoryAdminTiles extends StatefulWidget {
  const MedicalHistoryAdminTiles({super.key});

  @override
  State<MedicalHistoryAdminTiles> createState() => _MedicalHistoryAdminTilesState();
}

class _MedicalHistoryAdminTilesState extends State<MedicalHistoryAdminTiles> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
            delegate: SliverChildListDelegate(
              [
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      leading: Container(
                        width: 75,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/dokter_1.png'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.rectangle,
                           borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      title: Text('Muhammad Ilham Ramadhani',
                       style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('3122500023'), // Subtitle pertama
                        ],
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'Tanggal Periksa: 01 Mei 2024',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8), 
                              Text(
                                'Dokter: Dr. M. Dwiya Lakhsmana',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8), // Add some spacing between the lines
                              Text(
                                'Gejala:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '• Kepala pusing\n'
                                '• Muntah\n'
                                '• Nafsu makan berkurang\n'
                                '• Perut kembung / tidak nyaman',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Diagnosa:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Maag',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red.shade500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Obat:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Mylanta',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Kritik & Saran:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '• Minum obat 2x sehari\n'
                                '• Minum air putih yang cukup sepanjang hari untuk menjaga hidrasi.\n'
                                '• Istirahat dan hindari stres berlebihan.\n'
                                '• Jangan makan makanan pedas, asam.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      leading: Container(
                        width: 75,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Orang_2.png'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      title: Text('Shofira Izza Nurrohmah',
                       style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('3122500023'), // Subtitle pertama
                        ],
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'Tanggal Periksa: 01 Mei 2024',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8), 
                              Text(
                                'Dokter: Dr. M. Dwiya Lakhsmana',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8), // Add some spacing between the lines
                              Text(
                                'Gejala:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '• Kepala pusing\n'
                                '• Muntah\n'
                                '• Nafsu makan berkurang\n'
                                '• Perut kembung / tidak nyaman',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Diagnosa:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Maag',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red.shade500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Obat:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Mylanta',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Kritik & Saran:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '• Minum obat 2x sehari\n'
                                '• Minum air putih yang cukup sepanjang hari untuk menjaga hidrasi.\n'
                                '• Istirahat dan hindari stres berlebihan.\n'
                                '• Jangan makan makanan pedas, asam.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),// Tambahkan Card lainnya di sini jika diperlukan
              ],
            ),
          );
  }
}