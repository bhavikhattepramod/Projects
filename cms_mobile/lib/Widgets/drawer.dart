import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../Screens/Additional Screens/home_screen.dart';
import '../Screens/Additional Screens/myprofile_screen.dart';
import '../Screens/Extra Screens/whatweoffer_screen.dart';
import '../Screens/Extra Screens/about_us_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
                title: const Row(
                  children: [
                    Expanded(
                      child: Text('My Profile'),
                    ),
                    Icon(Icons.person),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfile()));
                }),
                ListTile(
                title: const Row(
                  children: [
                    Expanded(
                      child: Text('What We Offer'),
                    ),
                    Icon(Icons.star),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WhatWeOfferScreen()));
                }),
            ListTile(
                title: const Row(
                  children: [
                    Expanded(
                      child: Text('About Us'),
                    ),
                    Icon(Icons.info),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUsScreen()));
                }),
            ListTile(
                title: const Row(
                  children: [
                    Expanded(
                      child: Text('Settings'),
                    ),
                    Icon(Icons.settings),
                  ],
                ),
                onTap: () {
                  print("Settings");
                }),
            ListTile(
              title: const Row(
                children: [
                  Expanded(child: Text('Logout')),
                  Icon(
                    Icons.logout,
                  )
                ],
              ),
              onTap: () {
                storage.deleteAll();
                Navigator.pushAndRemoveUntil<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HomeScreen()),
                  ModalRoute.withName('/'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
