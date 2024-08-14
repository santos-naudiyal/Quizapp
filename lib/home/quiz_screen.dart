import 'package:flutter/material.dart';
import 'package:quizapp/Resultscreen/result_screen.dart';
import 'package:quizapp/model/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int consecutiveWrong = 0;
  int currentQuestion = 0;
  int? selectedOptionIndex; 

  final List<Question> questions = [
    Question('What is 2+2?', ['3', '4', '5', '6'], 1),
    Question('What is the capital of France?', ['Berlin', 'Paris', 'Rome', 'Madrid'], 1),
    Question('What is the largest planet?', ['Earth', 'Mars', 'Jupiter', 'Venus'], 2),
    Question('Who wrote "Romeo and Juliet"?', ['Shakespeare', 'Hemingway', 'Tolstoy', 'Dostoevsky'], 0),
    Question('Which element has the chemical symbol "O"?', ['Oxygen', 'Gold', 'Osmium', 'Oganesson'], 0),
    Question('What is the square root of 64?', ['6', '7', '8', '9'], 2),
    Question('Which ocean is the largest?', ['Atlantic', 'Indian', 'Arctic', 'Pacific'], 3),
    Question('How many continents are there?', ['5', '6', '7', '8'], 2),
    Question('What is the boiling point of water?', ['50°C', '75°C', '100°C', '125°C'], 2),
    Question('Which planet is known as the Red Planet?', ['Earth', 'Mars', 'Jupiter', 'Saturn'], 1),
    Question('Which country is known as the Land of the Rising Sun?', ['China', 'South Korea', 'Japan', 'Thailand'], 2),
    Question('What is the hardest natural substance on Earth?', ['Gold', 'Iron', 'Diamond', 'Platinum'], 2),
    Question('Who painted the Mona Lisa?', ['Van Gogh', 'Da Vinci', 'Picasso', 'Michelangelo'], 1),
    Question('Which country hosted the 2016 Summer Olympics?', ['China', 'Brazil', 'USA', 'UK'], 1),
    Question('What is the chemical symbol for gold?', ['Au', 'Ag', 'Pb', 'Fe'], 0),
    Question('Which language has the most native speakers?', ['English', 'Mandarin', 'Spanish', 'Hindi'], 1),
    Question('Which continent is the Sahara Desert located in?', ['Asia', 'Africa', 'Australia', 'North America'], 1),
    Question('What is the tallest mountain in the world?', ['K2', 'Kangchenjunga', 'Everest', 'Lhotse'], 2),
    Question('What is the smallest prime number?', ['0', '1', '2', '3'], 2),
    Question('What is the largest mammal?', ['Elephant', 'Blue Whale', 'Giraffe', 'Shark'], 1),
  ];

  void selectOption(int index) {
    setState(() {
      selectedOptionIndex = index;
      if (index == questions[currentQuestion].correctIndex) {
        consecutiveWrong = 0;
        showCorrectAnswerPopup();
      } else {
        consecutiveWrong++;
        if (consecutiveWrong == 2) {
          navigateToResult("You failed");
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Wrong answer. Try again.')),
          );
        }
      }
    });
  }

  void showCorrectAnswerPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Correct!', style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text('You have selected the correct answer.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  currentQuestion++;
                  selectedOptionIndex = null; 
                });
              },
              child: Text('Next Question'),
            ),
          ],
        );
      },
    );
  }

  void navigateToResult(String resultMessage) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(resultMessage: resultMessage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Quiz',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    questions[currentQuestion].question,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ...questions[currentQuestion].options.asMap().entries.map(
                    (entry) {
                      int idx = entry.key;
                      String option = entry.value;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: () => selectOption(idx),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black, backgroundColor: idx == selectedOptionIndex
                                ? (idx == questions[currentQuestion].correctIndex
                                    ? Colors.green
                                    : Colors.red)
                                : Colors.white, // Text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: (selectedOptionIndex != null && selectedOptionIndex == idx)
                                    ? (idx == questions[currentQuestion].correctIndex
                                        ? Colors.green
                                        : Colors.red)
                                    : Colors.grey,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              option,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

