import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataDokter extends StatefulWidget {
  const DataDokter({super.key});

  @override
  State<DataDokter> createState() => _DataDokterState();
}

class _DataDokterState extends State<DataDokter> {
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
              "Data Dokter",
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                width: 0, // Adjust the width as needed
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(250, 250, 250, 1), // Using RGB values
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10), // Adjust the padding
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromRGBO(26, 154, 142, 1), // Set the color of the icon
                      ),
                      hintText: "Cari nama dokter",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(171, 171, 171, 1),
                        fontSize: 16,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Add other SliverList or SliverGrid here as per your requirement
          SliverList(
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      if (index == 0) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Card(
            color: Colors.white,
            shadowColor: Colors.black87,
            elevation: 8, // Adjust the elevation value for a more prominent shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Optional: rounded corners
            ),
            child: ListTile(
              title: Text('Dr. M. Dwiya Lakhsmana',
              style: TextStyle(
                fontSize: 16.0, // Ukuran teks
                fontWeight: FontWeight.bold, // Ketebalan teks
                color: Colors.black, // Warna teks
              ),
              ),
              subtitle: Text('Umum',
              style: TextStyle(
                fontSize: 16.0, // Ukuran teks
                fontWeight: FontWeight.w400, // Ketebalan teks
                color: Colors.black, // Warna teks
              ),
              ),
              trailing: Text('4 th',
              style: TextStyle(
                fontSize: 16.0, // Ukuran teks
                fontWeight: FontWeight.w400, // Ketebalan teks
                color: Colors.black, // Warna teks
              ),
              ),
              leading: Icon(Icons.account_circle_sharp, size: 60, color: Color.fromRGBO(204, 204, 204, 1)),
              contentPadding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 3, // Top padding
                bottom: 1, 
              ),
            ),
          ),
        );
      } else if (index == 1) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Card(
            color: Colors.white,
            shadowColor: Colors.black87,
            elevation: 8, // Adjust the elevation value for a more prominent shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Optional: rounded corners
            ),
            child: ListTile(
              title: Text('Dr. Firza Sharfina Izzati',
              style: TextStyle(
                fontSize: 16.0, // Ukuran teks
                fontWeight: FontWeight.bold, // Ketebalan teks
                color: Colors.black, // Warna teks
              ),
              ),
              subtitle: Text('Umum',
              style: TextStyle(
                fontSize: 16.0, // Ukuran teks
                fontWeight: FontWeight.w400, // Ketebalan teks
                color: Colors.black, // Warna teks
              ),
              ),
              trailing: Text('3 th',
              style: TextStyle(
                fontSize: 16.0, // Ukuran teks
                fontWeight: FontWeight.w400, // Ketebalan teks
                color: Colors.black, // Warna teks
              ),
              ),
              leading: Icon(Icons.account_circle_sharp, size: 60, color: Color.fromRGBO(204, 204, 204, 1)),
              contentPadding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 3, // Top padding
                bottom: 1, 
              ),
            ),
          ),
        );
      } else {
        // Add more ListTiles as needed
        return Container(
          padding: EdgeInsets.all(10),
          child: Card(
            color: Colors.white,
            shadowColor: Colors.black87,
            elevation: 8, // Adjust the elevation value for a more prominent shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Optional: rounded corners
            ),
            child: ListTile(
              title: Text('Dr. Budi Utomo',
              style: TextStyle(
                fontSize: 16.0, // Ukuran teks
                fontWeight: FontWeight.bold, // Ketebalan teks
                color: Colors.black, // Warna teks
              ),),
              subtitle: Text('Umum',
              style: TextStyle(
                fontSize: 16.0, // Ukuran teks
                fontWeight: FontWeight.w400, // Ketebalan teks
                color: Colors.black, // Warna teks
              ),
              ),
              trailing: Text('5 th',
              style: TextStyle(
                fontSize: 16.0, // Ukuran teks
                fontWeight: FontWeight.w400, // Ketebalan teks
                color: Colors.black, // Warna teks
              ),
              ),
              leading: Icon(Icons.account_circle_sharp, size: 60, color: Color.fromRGBO(204, 204, 204, 1)),
              contentPadding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 3, // Top padding
                bottom: 1, 
              ),
            ),
          ),
        );
      }
    },
    childCount: 3, // Set the total number of ListTiles
  ),
),

        ],
      ),
    );
  }
}
