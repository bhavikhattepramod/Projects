import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Models/Basic/complianceworkflow_model.dart';


class ComplianceWorkflowScreen extends StatefulWidget {
  const ComplianceWorkflowScreen({Key? key}) : super(key: key);

  @override
  State<ComplianceWorkflowScreen> createState() => _ComplianceWorkflowScreenState();
}

class _ComplianceWorkflowScreenState extends State<ComplianceWorkflowScreen> {
  List<Map<String, dynamic>> complianceworkflow = [];
  List<Map<String, dynamic>> _complianceworkflow = [];
  final storage = const FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var session = await storage.read(key: 'cookie');
    final response = await http.get(Uri.parse('http://13.233.159.48/session/auth/compliance_workflow'),
    headers: {"Cookie": session.toString()});

    if (response.statusCode == 200) {
       final List<dynamic> data = json.decode(response.body);
      setState(() {
        _complianceworkflow = List<Map<String, dynamic>>.from(data);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compliance Work Flow'),
      ),
      body: Center(
        child: _complianceworkflow.isEmpty
            ? const Text('No records to display')
            : ListView.builder(
                itemCount: _complianceworkflow.length,
                itemBuilder: (context, index) {
                  final complianceworkflow = _complianceworkflow[index];
                    return GestureDetector(
                    onTap: () {
                      // navigateToDetailPage(proposals[index]['id']);
                    },
                    child:ComplianceWorkFlowModel(
                    id: complianceworkflow['id'],
                    name: complianceworkflow['name'],
                    status: complianceworkflow['status'], 
                    ),
                  );
                },
              ),
      ),
      
    );
  }

  // void navigateToDetailPage(int proposalId) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => ComplianceDetail(proposalId: proposalId),
  //     ),
  //   );
  // }
}



