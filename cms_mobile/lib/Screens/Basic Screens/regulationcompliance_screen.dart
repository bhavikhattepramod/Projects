import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Models/Basic/regulationcompliance_model.dart';

class RegulationsComplianceScreen extends StatefulWidget {
  const RegulationsComplianceScreen({Key? key}) : super(key: key);

  @override
  State<RegulationsComplianceScreen> createState() => _RegulationsComplianceScreenState();
}

class _RegulationsComplianceScreenState extends State<RegulationsComplianceScreen> {
  List<dynamic> data = [];
  List<Map<String, dynamic>> _RegulationsCompliance = [];

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
            'http://13.233.159.48/session/auth/regulations_and_compliance'),
        headers: {"Cookie": session.toString()});
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _RegulationsCompliance = List<Map<String, dynamic>>.from(data);
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
          'Regulations and Compliance',
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
          //     builder: (context) => const RegulationsDetails(),
          //   ),
          // );
        },
        child: _RegulationsCompliance.isEmpty
            ? const Text('No records to display')
            : ListView.builder(
                itemCount: _RegulationsCompliance.length,
                itemBuilder: (context, index) {
                  final regulations = _RegulationsCompliance[index];
                  return RegulationsComplianceModel(
                      id: regulations['id'], 
                      name: regulations['name'],
                      );
                },
              ),
      ),
    );
  }
}
