import 'package:flutter/material.dart';

import '../../Widgets/widgets.dart';


class ComplianceCalenderModel extends StatelessWidget {
  final int id;
  final String name;
  final String date;
  final String work_flow;

  const ComplianceCalenderModel(
      {super.key,
      required this.id,
      required this.name,
      required this.date,
      required this.work_flow});

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
                  Text(name,
                  style: const TextStyle(fontWeight: FontWeight.bold),),
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Styledtext("Date")),
                  const Flexible(
                      flex: 1, fit: FlexFit.tight, child: Styledtext(":")),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Text(date),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Styledtext("Work Flow")),
                  const Flexible(
                      flex: 1, fit: FlexFit.tight, child: Styledtext(":")),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Text(work_flow),
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
