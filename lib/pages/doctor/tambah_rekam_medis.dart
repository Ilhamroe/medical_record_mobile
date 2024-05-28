import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  String? _selectedName;

  final List<String> _patientNames = [
    '3122500001 - Ade Hafis Rabbani',
    '3122500002 - Nadila Aulia Mirdianti',
    '3122500003 - Zahrotul Hidayah',
    '3122500004 - Denti Widayati',
    '3122500005 - Ari Yoga',
    '3122500020 - Ilham Ramadhani',
    '3122500025 - Rifqi Rayita',
    '3122500030 - Syahrul Ramadhan',
  ];

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
                            fontSize: MediaQuery.of(context).size.width * 0.055,
                            color: pureWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.105,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/atom.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
                padding: const EdgeInsets.all(16.0),
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
                      const SizedBox(height: 5),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Simpan rekam medis
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Rekam medis tersimpan')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFF30ADA2),
                            minimumSize: const Size(210, 48), // Ukuran minimum
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          child: const Text(
                            '+ Tambah Rekam Medis',
                            style: TextStyle(fontSize: 16),
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
      padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0), // Pastikan padding tidak terlalu besar
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width *
                0.2, // Kurangi lebar label lebih lanjut
            padding: const EdgeInsets.only(top: 15), // Padding atas untuk label
            child: Text(label, style: const TextStyle(fontSize: 16)),
          ),
          SizedBox(width: 3), // Jaga ruang antara label dan dropdown
          Expanded(
            // Gunakan Expanded untuk dropdown
            child: child,
          ),
        ],
      ),
    );
  }
}
