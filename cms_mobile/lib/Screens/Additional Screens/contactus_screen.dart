import 'dart:convert';


import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Widgets/widgets.dart';
import 'thankyouscreen.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _company = TextEditingController();
  final _subject = TextEditingController();
  final _question = TextEditingController();

  final storage = const FlutterSecureStorage();

  final WidthSizedBox = const SizedBox(width: 10);
  final HeightSizedBox = const SizedBox(height: 20);

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _company.dispose();
    _subject.dispose();
    _question.dispose();
    super.dispose();
  }

  Map<String, String> headers = {};

  void postdata() async {
    var session = await storage.read(key: 'cookie');
    var jsonMap = {
      "name": _name.text,
      "phone": _phone.text,
      "email": _email.text,
      "company": _company.text,
      "subject": _subject.text,
      "question": _question.text,
    };
    final response = await http.post(
        Uri.parse('http://13.233.159.48/session/auth/contact_us'),
        body: jsonEncode(jsonMap),
        headers: {
          "Content-type": "application/json",
          "Cookie": session.toString(),
          'Accept': '*/*'
        }
        );
    if (response.statusCode == 200) {
      Navigator.pushAndRemoveUntil<void>(context,
          MaterialPageRoute<void>(builder: (BuildContext context) => const ThankyouScreen()),
          ModalRoute.withName('/'),);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'Contact Us',
        ),
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Contact us about anything related to our company or services.\nWe\'ll do our best to get back to you as soon as possible.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Styledtext('Your Name'),
                    ),
                    WidthSizedBox,
                    const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Styledtext(':'),
                    ),
                    WidthSizedBox,
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: _name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                            width: 1.0,
                          ))),
                        ),
                      ),
                    )
                  ],
                ),
                HeightSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Styledtext("Phone Number")),
                    WidthSizedBox,
                    const Flexible(
                        flex: 1, fit: FlexFit.tight, child: Styledtext(":")),
                    WidthSizedBox,
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: _phone,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                HeightSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Styledtext("Your Email"),
                    ),
                    WidthSizedBox,
                    const Flexible(
                        flex: 1, fit: FlexFit.tight, child: Styledtext(":")),
                    WidthSizedBox,
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: _email,
                            keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                           decoration: const InputDecoration(
                              border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                          ),
                           ),
                        ),
                      ),
                    ),
                  ],
                ),
                HeightSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Styledtext("Your Company")),
                    WidthSizedBox,
                    const Flexible(
                        flex: 1, fit: FlexFit.tight, child: Styledtext(":")),
                    WidthSizedBox,
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _company,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                HeightSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Styledtext("Subject")),
                    WidthSizedBox,
                    const Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Styledtext(
                          ":",
                        )),
                    WidthSizedBox,
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _subject,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
                HeightSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Styledtext("Your Question")),
                    WidthSizedBox,
                    const Flexible(
                        flex: 1, fit: FlexFit.tight, child: Styledtext(":")),
                    WidthSizedBox,
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: SizedBox(
                        child: TextField(
                          controller: _question,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          minLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    minimumSize: const Size(300, 60),
                    padding: const EdgeInsets.all(10),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, submit the data
                      postdata();
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
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
