import 'package:flutter/material.dart';
import 'package:quizapp/home/quiz_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Quiz App',
            style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold,
              color: Colors.white, 
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple, 
        elevation: 8, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30), 
          ),
        ),
      ),
      backgroundColor: Colors.white, 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end, 
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              child: Text('Start Quiz'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, 
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

