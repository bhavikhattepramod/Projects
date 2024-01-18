import 'package:flutter/material.dart';

class WhatWeOfferScreen extends StatefulWidget {
  const WhatWeOfferScreen({Key? key}) : super(key: key);

  @override
  State<WhatWeOfferScreen> createState() => _WhatWeOfferScreenState();
}

class _WhatWeOfferScreenState extends State<WhatWeOfferScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'What We Offer',
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
          body: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                                 Text(
                    'Get Compliance, Stay Compliant',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Compliance will help to evolve with new laws and regulations.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Compliance is about more than just ticking boxes, it\'s about doing the right thing.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'By choosing a Compliance Management System, businesses can streamline their compliance efforts, reduce risks, enhance collaboration, and ensure adherence to regulatory requirements, ultimately protecting their reputation and minimizing potential penalties or legal issues.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Remember, compliance is not just a requirement—it\'s an opportunity to strengthen your business and build trust with stakeholders. Partner with PRIME MINDS for comprehensive compliance solutions you can rely on.',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'An Intuitive, Modern Interface',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'If compliance wants to be seen as modern and responsive, the user interface should be the same.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Speeds up compliance and informed decision making',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Compliance software helps to protect your company’s legal and financial worthiness to speed up compliance and informed decision-making',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Less Legal Complexities',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your business should adhere to legal, social, corporate, financial, government and environmental compliance as well as a framework to function without a glitch for avoiding penalties, fines and legal suits',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your own Compliance Calendar',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Be ahead of time do not miss out any important dates.',
                    style: TextStyle(fontSize: 16),
                  ),
            ListTile(
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Prime Minds Consulting Pvt. Ltd.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      '19, 9th Cross Rd, Malleswaram, Bengaluru, Karnataka 560003, India'),
                  Text('+918035000138'),
                  Text('support@complynow.in'),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                'Copyright ©Prime Minds Consulting Pvt. Ltd.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
        
                ],
              ),
            ),
          ),
        ),
    
    );
  }
}
