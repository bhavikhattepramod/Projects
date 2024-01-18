import 'package:flutter/material.dart';

class ThankyouScreen extends StatelessWidget{
  const ThankyouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
  const Scaffold(body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Thank you ',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

}