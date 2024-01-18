
import 'package:flutter/material.dart';

import '../../Widgets/widgets.dart';
import '../loginscreen.dart';
import 'contactus_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              elevatedtext: 'Login',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              elevatedtext: 'Contact Us',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactUsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
