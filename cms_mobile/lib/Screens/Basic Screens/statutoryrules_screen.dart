import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Models/Basic/statutory_rulesmodel.dart';


class StatutoryRulesScreen extends StatefulWidget {
  const StatutoryRulesScreen({Key? key}) : super(key: key);

  @override
  State<StatutoryRulesScreen> createState() => _StatutoryRulesScreenState();
}

class _StatutoryRulesScreenState extends State<StatutoryRulesScreen> {
  List<dynamic> data = [];
  List<Map<String, dynamic>> _statutoryRules = [];

  final storage = const FlutterSecureStorage();
 

  @override
  void initState() {
    super.initState();
    fetchData();
  }

   Future<void> fetchData() async {
    var session = await storage.read(key: 'cookie');
    final response = await http.get(
        Uri.parse(
            'http://13.233.159.48/session/auth/statutory_rules'),
        headers: {"Cookie": session.toString()});
    print(response.body);
    if (response.statusCode == 200) {
       final List<dynamic> data = json.decode(response.body);
      setState(() {
        _statutoryRules = List<Map<String, dynamic>>.from(data);
      });
    } else {
      throw Exception('Failed to load data');
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
          'Statutory Rules',
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
      body: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const StatutoryDetails(),
          //   ),
          // );
        },
        child:Center(
        child: _statutoryRules.isEmpty
            ? const Text('No records to display'):ListView.builder(
          itemCount: _statutoryRules.length,
          itemBuilder: (context, index) {
            final statutoryrules = _statutoryRules[index];
            return StatutoryRulesModel(
              id: statutoryrules['id'],
              name: statutoryrules['name'],
              description: statutoryrules['description'],
              state: statutoryrules['state'],
            );
          },
            ),
      ),),
    );
    

  }
}
  