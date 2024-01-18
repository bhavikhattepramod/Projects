import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProposalDetailScreen extends StatefulWidget {
  final int proposalId;

  ProposalDetailScreen({required this.proposalId});

  @override
  _ProposalDetailScreenState createState() => _ProposalDetailScreenState();
}

class _ProposalDetailScreenState extends State<ProposalDetailScreen> {
  String pdfBase64 = '';

  @override
  void initState() {
    super.initState();
    fetchPdf();
  }

  Future<void> fetchPdf() async {
    final response = await http.get(
      Uri.parse('http://13.233.159.48/session/auth/proposal_pdf/${widget.proposalId}'),
    );

    if (response.statusCode == 200) {
      setState(() {
        pdfBase64 = response.body;
      });
    } else {
      // Handle error
      print('Failed to load PDF');
    }
  }

  Future<void> _showPdf() async {
    // final pdf = pdfLib.Document();

    // final List<int> bytes = base64Decode(pdfBase64);
    // pdf.addPage(pdfLib.Page(build: (pdfLib.Context context) {
    //   return pdfLib.Image(pdfLib.MemoryImage(bytes));
    // }));

    // // Save the PDF to a file and open it
    // final file = await pdf.save();
    // TODO: Open the PDF file using a suitable PDF viewer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proposal Detail'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showPdf(),
          child: Text('Show PDF'),
        ),
      ),
    );
  }
}