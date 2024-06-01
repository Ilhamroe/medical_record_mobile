import 'package:e_klinik_pens/authentication/service_auth.dart';
import 'package:e_klinik_pens/models/users.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  ServiceAuth serviceAPI = ServiceAuth();
  late Future<List<User>> listData;

  @override
  void initState() {
    super.initState();
    listData = serviceAPI.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Page"),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: listData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              List<User> valueData = snapshot.data!;
              return ListView.builder(
                itemCount: valueData.length,
                itemBuilder: (context, index) {
                  User user = valueData[index];
                  return ListTile(
                    textColor: themeDark,
                    title: Text(user.email),
                    subtitle: Text(user.number ?? 'No number available'),
                    trailing: Text(user.nrp),
                  );
                },
              );
            } else if (snapshot.hasError) {
              print('Snapshot error: ${snapshot.error}');
              return Text("Error: ${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
