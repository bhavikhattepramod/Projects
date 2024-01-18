
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Models/Basic/proposalmodel.dart';
import '../Inside Screens/proposal_pdf.dart';

class ProposalScreen extends StatefulWidget {
  const ProposalScreen({Key? key}) : super(key: key);

  @override
  State<ProposalScreen> createState() => _ProposalScreenState();
}

class _ProposalScreenState extends State<ProposalScreen> {
  List<dynamic> data = [];
  List<Map<String, dynamic>> _proposals = [];

  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var session = await storage.read(key: 'cookie');
    final response = await http.get(
        Uri.parse('http://13.233.159.48/session/auth/my_proposal'),
        headers: {"Cookie": session.toString()});
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _proposals = List<Map<String, dynamic>>.from(data);
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
          'proposals',
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
      body: Center(
        child: _proposals.isEmpty
            ? const Text('No records to display')
            : ListView.builder(
                itemCount: _proposals.length,
                itemBuilder: (context, index) {
                  final proposal = _proposals[index];
                  return Proposal(
                    id: proposal['id'],
                    name: proposal['name'],
                    description: proposal['description'],
                    status: proposal['status'],
                  );
                
                },
              ),
      ),
    );
  } 


void navigateToProposalDetailScreen(int proposalId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProposalDetailScreen(proposalId: proposalId),
      ),
    );
  }
}