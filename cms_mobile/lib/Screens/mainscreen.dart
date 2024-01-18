
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../Widgets/drawer.dart';
import '../Widgets/widgets.dart';
import 'Basic Screens/compliancecalender_screen.dart';
import 'Basic Screens/complianceworkflow_screen.dart';
import 'Basic Screens/proposal_screen.dart';
import 'Basic Screens/regulationcompliance_screen.dart';
import 'Basic Screens/statutoryrules_screen.dart';

class PortalScreen extends StatefulWidget {
  const PortalScreen({Key? key}) : super(key: key);

  @override
  State<PortalScreen> createState() => _PortalScreenState();
}

class _PortalScreenState extends State<PortalScreen> {
  var storage = const FlutterSecureStorage();
  var Sizedbox = const SizedBox(
    height: 20,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'Portal Page',
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
      endDrawer:CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PortaElevatedButton(
                elevatedtext: 'Proposal',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProposalScreen(),
                    ),
                  );
                },
              ),
              Sizedbox,
              PortaElevatedButton(
                elevatedtext: 'Statutory Rules',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StatutoryRulesScreen(),
                    ),
                  );
                },
              ),
              Sizedbox,
              PortaElevatedButton(
                elevatedtext: 'Internal Compliances',
                onTap: () {},
              ),
              Sizedbox,
              PortaElevatedButton(
                elevatedtext: 'Regulations and Compliance Calendar',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegulationsComplianceScreen(),
                    ),
                  );
                },
              ),
              Sizedbox,
              PortaElevatedButton(
                elevatedtext: 'Compliance Calendar',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ComplianceCalenderScreen(),
                    ),
                  );
                },
              ),
              Sizedbox,
              PortaElevatedButton(
                elevatedtext: 'Compliance - Workflow',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ComplianceWorkflowScreen(),
                    ),
                  );
                },
              ),
              Sizedbox,
              PortaElevatedButton(
                elevatedtext: 'Remainder - Email',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
