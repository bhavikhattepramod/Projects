import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Widgets/widgets.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<dynamic> data = [];
  late Future<List<Map<String, dynamic>>> _userData;

  final storage = const FlutterSecureStorage();
  late Uint8List bytes;

  @override
  void initState() {
    super.initState();
    _userData = fetchUserData();
  }

  Future<List<Map<String, dynamic>>> fetchUserData() async {
    var session = await storage.read(key: 'cookie');
    final response = await http.get(
        Uri.parse('http://13.233.159.48/session/auth/user_details'),
        headers: {"Cookie": session.toString()});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'My Profile',
        ),
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<Map<String, dynamic>> userData = snapshot.data!;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                    radius: 60,
                    child: Icon(Icons.person),
                  ),
                  const SizedBox(height: 25,),
                    Text(
                      userData[0]["name"],
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Styledtext('Email'),
                          ),
                          const Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Styledtext(':'),
                          ),
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: SizedBox(
                              height: 25,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Text(
                                  userData[0]["email"],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Styledtext('Phone'),
                          ),
                          const Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Styledtext(':'),
                          ),
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: SizedBox(
                              height: 25,
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Text(userData[0]["phone"])),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Styledtext('Address'),
                          ),
                          const Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Styledtext(':'),
                          ),
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: SizedBox(
                              height: 40,
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Text(userData[0]["address"])),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}