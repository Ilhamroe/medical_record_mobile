import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconMenu extends StatelessWidget {
  const IconMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIconWithDescription(
            assetPath: "assets/images/icon_doctor.svg",
            description: "Dokter",
            onTap: () => Navigator.pushNamed(context, '/doctor_profile_detail'), 
          ),
          Spacer(),
          _buildIconWithDescription(
            assetPath: "assets/images/icon_gejala_diagnosa.svg",
            description: "Gejala &\nDiagnosa",
            onTap: () => Navigator.pushNamed(context, '/gejala_diagnosa_detail'), 
          ),
          Spacer(),
          _buildIconWithDescription(
            assetPath: "assets/images/icon_saran_masukan.svg",
            description: "Saran &\nMasukan",
            onTap: () => Navigator.pushNamed(context, '/kritik_saran_detail'), 
          ),
        ],
      ),
    );
  }

  Widget _buildIconWithDescription({
    required String assetPath,
    required String description,
    VoidCallback? onTap, 
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap, 
        child: Column(
          children: [
            SizedBox(width: 40, height: 40),
            _buildSvgIcon(assetPath),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSvgIcon(String assetPath) {
    return SvgPicture.asset(
      assetPath,
      width: 70,
      height: 50,
    );
  }
}
