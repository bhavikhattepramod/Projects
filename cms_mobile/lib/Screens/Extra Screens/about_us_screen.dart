import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          // iconTheme: Theme.of(context).appBarTheme.iconTheme,
          // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          // automaticallyImplyLeading: false,
          title: const Text(
            'About Us',
          ),
          centerTitle: true,
          elevation: 2,
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Sudheendra(),
                  ),
                );
              },
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/sudheendra.jpeg"),
                      ),
                      Column(
                        children: [
                          Text(
                            'Sudheendra Walvekar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Founder and MD\nChief Visionary')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // const ListTile(
            //   title: Text(
            //     'Founder and chief visionary, Sudheendra is the driving force behind the company. He loves to keep his hands full by participating in the development of the software, marketing, and customer experience strategies.',
            //     textAlign: TextAlign.justify,
            //   ),
            // ),

            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Sukesh(),
                  ),
                );
              },
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/sukesh.jpeg"),
                      ),
                      Column(
                        children: [
                          Text(
                            'Sukesh Shivapuram',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('CFO')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text('Application'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '100+',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text('Compliances'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              '1000+',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text('Laws'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text('Penalties to be paid'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            const ListTile(
              subtitle: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Prime Minds Consulting Pvt. Ltd.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        '19, 9th Cross Rd, Malleswaram, Bengaluru, Karnataka 560003, India'),
                    Text('+918035000138'),
                    Text('support@complynow.in'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Center(
              child: Text(
                'Copyright ©Prime Minds Consulting Pvt. Ltd.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sudheendra extends StatelessWidget {
  const Sudheendra({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  
                ),
                
              ),
              height:250,
              width: double.infinity,
              alignment: Alignment.center,
              child:Image.asset("assets/sudheendra.jpeg") ,
            ),
            
            const SizedBox(
              height: 40,
            ),
            const Column(
              children: [
                Text('Sudheendra Walvekar \nFounder and MD',
                style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                      'Founder and chief visionary, Sudheendra is the driving force behind the company. He loves to keep his hands full by participating in the development of the software, marketing, and customer experience strategies.',
                                      style: TextStyle(fontSize: 15,
                  ),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Sukesh extends StatelessWidget {
  const Sukesh({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/sukesh.jpeg"),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Sukesh Shivapuram, CFO'),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                      'Sukesh with his international experience, helps us easily understand the numbers and improves them. He is determined to drive success and delivers his professional acumen to bring the company to the next level.')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
