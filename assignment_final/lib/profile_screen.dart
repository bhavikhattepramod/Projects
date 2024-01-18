import 'package:assignment_final/question_screen.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState
    extends State<ProfileScreen> {
  int _currentIndex = 1;

  final List<Widget> _tabs = [
    const CertificateTab(),
    const ProfileTab(),
    const ChatTab(),
    const ScoreTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Certificate',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.score),
            label: 'Score',
            backgroundColor: Colors.black
          ),
        ],
      ),
    );
  }
}

class CertificateTab extends StatelessWidget {
  const CertificateTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Certificate Tab'),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const AnswerQuestionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Win Certificate',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
    
    );
  }
}

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Chat Tab'),
    );
  }
}

class ScoreTab extends StatelessWidget {
  const ScoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Score Tab'),
    );
  }
}