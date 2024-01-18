import 'package:flutter/material.dart';

import '../../Widgets/widgets.dart';

class ComplianceWorkFlowModel extends StatelessWidget {
  final int id;
  final String name;
  final String status;

  const ComplianceWorkFlowModel({
    super.key,
    required this.id,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Styledtext("Name")),
                    const Flexible(
                        flex: 1, fit: FlexFit.tight, child: Styledtext(":")),
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Text(name),
                    ),
                  ],
                ),
                const SizedBox(height:8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Styledtext("status")),
                    const Flexible(
                        flex: 1, fit: FlexFit.tight, child: Styledtext(":")),
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Container(
                    padding:
                        const EdgeInsets.all(8.0), // Adjust padding as needed
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius:
                          BorderRadius.circular(15.0), // Adjust border radius
                    ),
                    child: Text(
                      status,
                      style: const TextStyle(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                    ),
                  ],
                ),
             
              
            ],
          ),
        ),
      ),
    );
  }
}
