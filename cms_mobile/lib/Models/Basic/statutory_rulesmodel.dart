import 'package:flutter/material.dart';

import '../../Widgets/widgets.dart';

class StatutoryRulesModel extends StatelessWidget {
  final int id;
  final String name;
  final String description;
  final String state;

  const StatutoryRulesModel({super.key, 
    required this.id,
    required this.name,
    required this.description,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
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
                      child: Styledtext("Contract Ref")),
                  const Flexible(
                      flex: 1, fit: FlexFit.tight, child: Styledtext(":")),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Text(name),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Styledtext("Description")),
                  const Flexible(
                      flex: 1, fit: FlexFit.tight, child: Styledtext(":")),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Text(description),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Flexible(
                      flex: 2, fit: FlexFit.tight, child: Styledtext("Status")),
                  const Flexible(
                      flex: 1, fit: FlexFit.tight, child: Styledtext(":")),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Container(
                      padding:
                          const EdgeInsets.all(8.0), 
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.circular(15.0), 
                      ),
                      child: Text(
                        state,
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
