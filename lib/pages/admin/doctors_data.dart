import 'package:e_klinik_pens/authentication/service_auth.dart';
import 'package:e_klinik_pens/models/users.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataDokter extends StatefulWidget {
  const DataDokter({super.key});

  @override
  State<DataDokter> createState() => _DataDokterState();
}

class _DataDokterState extends State<DataDokter> {
  String _searchMessage = '';
  ServiceAuth serviceAPI = ServiceAuth();
  late Future<List<User>> listData;
  List<User> userList = [];
  List<User> filteredList = []; 

  void _runFilter(String enteredKeyword) {
    List<User> results;
    if (enteredKeyword.isEmpty) {
      results = userList;
      _searchMessage = '';
    } else {
      results = userList
          .where((user) =>
              user.name.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              user.nrp.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      if (results.isNotEmpty) {
        _searchMessage = '';
      } else {
        _searchMessage = 'Tidak Ada Dokter Bernama atau NIP: "$enteredKeyword"';
      }
    }

    setState(() {
      filteredList = results;
    });
  }

  @override
  void initState() {
    super.initState();
    listData = serviceAPI.getAllUsers();
    listData.then((data) {
      setState(() {
        userList = data;
        filteredList = data;
      });
    }).catchError((error) {
      setState(() {
        _searchMessage = 'Error: $error';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: FutureBuilder<List<User>>(
        future: listData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: themeLight,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 12.0).r,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: pureWhite,
                      ),
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
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10)
                            .w,
                    child: SizedBox(
                      width: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 250, 250, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          onChanged: (value) => _runFilter(value),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(26, 154, 142, 1),
                            ),
                            hintText: "Cari nama dokter",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(171, 171, 171, 1),
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _searchMessage.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20).w,
                          child: Center(
                            child: Text(
                              _searchMessage,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      User user = filteredList[index];
                      if (user.role == "dokter") {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 5.0),
                          child: Card(
                            surfaceTintColor: Colors.transparent,
                            color: pureWhite,
                            elevation: 5,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    user.image ?? 'assets/images/profile.png'),
                              ),
                              title: Text(
                                user.name ?? 'No Name',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                user.nrp ?? 'No NIP available',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              trailing: Text("Umum"),
                            ),
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                    childCount: filteredList.length,
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
