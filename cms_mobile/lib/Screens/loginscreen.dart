import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'mainscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final eidc = TextEditingController();
  final epass = TextEditingController();
  final storage = const FlutterSecureStorage();
  Map<String, String> headers = {};
  bool isHidden = true;
  bool trylog = false;
  timer() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context, true);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const PortalScreen()));
    });
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: const Color.fromARGB(255, 242, 124, 34),
    minimumSize: const Size(300, 60),
    padding: const EdgeInsets.all(25),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  Future<int> fetchAlbum(BuildContext context) async {
    Map<String, dynamic> jsonMap = {
      // "login": eidc.text,
      // "password": epass.text, 
      "login": "hema@ehe.com",
      "password": "123",
    };
    final response = await http.post(
        Uri.parse('http://13.233.159.48/session/auth/login'),
        body: jsonEncode(jsonMap),
        headers: {"Content-type": "application/json"});

    if (response.statusCode == 200) {
      // bool flag = false;

      String? rawCookie = response.headers['set-cookie'];
      if (rawCookie != null) {
        int index = rawCookie.indexOf(';');
        headers['cookie'] =
            (index == -1) ? rawCookie : rawCookie.substring(0, index);
      }
      await storage.write(key: 'cookie', value: headers['cookie']);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('LOGIN SUCCESFULL'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 100.0),
          duration: Duration(milliseconds: 500)));

      return 1;
    } else if (response.statusCode == 403) {
      setState(() {
        trylog = false;
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('INVALID CREDENTIALS'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom: 100.0),
            duration: Duration(milliseconds: 500)));
      });
    } else if (response.statusCode == 500) {
      setState(() {
        trylog = false;
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('INVALID CREDENTIALS'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom: 100.0),
            duration: Duration(milliseconds: 500)));
      });
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    // var obscureText = true;
    return Scaffold(
      appBar: AppBar(
        // titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        // iconTheme: Theme.of(context).appBarTheme.iconTheme,
        // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        // automaticallyImplyLeading: false,
        title: const Text(
          'LOGIN',
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                      width: 400,
                      height: 175,
                      child: Image.asset('assets/website.png')),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: eidc,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        suffixIcon: InkWell(
                          child:
                              Icon(Icons.person, color: Colors.grey, size: 20),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    controller: epass,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        hintText: 'Password',
                        suffixIcon: InkWell(
                          child: Icon(Icons.visibility,
                              color: Colors.grey, size: 20),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                          child: const Text(
                            "Forgot Password ?",
                            style: TextStyle(fontSize: 15, color: Colors.blue),
                          ),
                          onPressed: () {
          //                   Navigator.push(context,
          // MaterialPageRoute(builder: (context) => const ForgotPassword()));
                          }),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(12)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      minimumSize: const Size(300, 60),
                      padding: const EdgeInsets.all(10),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      setState(() {
                        trylog = true;
                      });
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                if (trylog)
                  FutureBuilder<int>(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == 1) {
                          timer();
                        }
                        return const Text('');
                      } else if (snapshot.hasError) {
                        return Center(child: Text('${snapshot.error}'));
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                    future: fetchAlbum(context),
                  )
              ],
            ),
          )),
    );
  }
}
