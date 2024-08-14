import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String resultMessage;

  ResultScreen({required this.resultMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Result',
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
      body: Center(
        child: Text(
          resultMessage,
          style: TextStyle(color: Colors.red, fontSize: 24),
        ),
      ),
    );
  }
}

