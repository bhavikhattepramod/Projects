import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Models/Basic/compliancecalender_model.dart';

class ComplianceCalenderScreen extends StatefulWidget {
  const ComplianceCalenderScreen({Key? key}) : super(key: key);

  @override
  State<ComplianceCalenderScreen> createState() => _ComplianceCalenderScreenState();
}

class _ComplianceCalenderScreenState extends State<ComplianceCalenderScreen> {
  List<dynamic> data = [];
  List<Map<String, dynamic>> _Calender = [];

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
            'http://13.233.159.48/session/auth/compliance_calender'),
        headers: {"Cookie": session.toString()});
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _Calender = List<Map<String, dynamic>>.from(data);
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
          'Compliance Calendar',
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
        child: _Calender.isEmpty
            ? const Text('No records to display')
            : ListView.builder(
                itemCount: _Calender.length,
                itemBuilder: (context, index) {
                  final calender = _Calender[index];
                  return ComplianceCalenderModel(
                      id: calender['id'],
                      name: calender['name'],
                      work_flow: calender['work_flow'],
                      date : calender['date'],
                      );
                },
              ),
      ),
    );
  }
}
