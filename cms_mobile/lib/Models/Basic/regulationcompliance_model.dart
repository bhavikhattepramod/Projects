import 'package:flutter/material.dart';

import '../../Widgets/widgets.dart';

class RegulationsComplianceModel extends StatelessWidget {
  final int id;
  final String name;

  const RegulationsComplianceModel({
    super.key,
    required this.id,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Styledtext("Regulations")),
                  const Flexible(
                      flex: 1, fit: FlexFit.tight, child: Styledtext(":")),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Text(name),
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
