import 'dart:async';

import 'package:assignment_final/thankyouscreen.dart';
import 'package:flutter/material.dart';

class AnswerQuestionScreen extends StatefulWidget {
  const AnswerQuestionScreen({super.key});

  @override
  _AnswerQuestionScreenState createState() => _AnswerQuestionScreenState();
}

class _AnswerQuestionScreenState extends State<AnswerQuestionScreen> {
  int _timeLeft = 30;
  Timer? _timer;
  bool _isQuestionBlocked = false;
  var questionText = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeLeft--;
        if (_timeLeft == 0) {
          _timer?.cancel();
          _isQuestionBlocked = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Tell me About Yourself?',style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 20),
            TextField(
              enabled: !_isQuestionBlocked,
              onChanged: (text) => questionText = text,
              decoration: const InputDecoration(
                hintText: 'Enter your Answer',
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black)),
              ),
              maxLines: 5,
              minLines: 5,
            ),
           const SizedBox(height: 20),
            Text('Time Left: $_timeLeft seconds'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isQuestionBlocked ? () => _submitAnswer() : null,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black87,
                minimumSize: const Size(300, 60),
                padding: const EdgeInsets.all(10),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: const Text('Submit Answer'),
              
            ),
          ],
        ),
      ),
    );
  }

  void _submitAnswer() {
     Navigator.pushAndRemoveUntil<void>(context,
          MaterialPageRoute<void>(builder: (BuildContext context) => const ThankyouScreen()),
          ModalRoute.withName('/'),);
  }
}
