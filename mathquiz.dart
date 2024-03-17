import 'dart:io';   // handles input and output operations 
import 'dart:math'; //  for performing common mathematical operations.

void main() {            // entry point for the program
  print('Welcome to Math Quiz Adventure!');
  print('Let\'s begin!\n');

  // Prompt the user for the personal details
  print('Please enter your name:');
  String name = stdin.readLineSync()!;
  print('Enter your age:');
  int age = int.parse(stdin.readLineSync()!);
  print('Enter your school:');
  String school = stdin.readLineSync()!;
  print('Enter your hobby:');
  String hobby = stdin.readLineSync()!;

  // Print user details
  print('\nHello, $name!');
  print('Age: $age');
  print('School: $school');
  print('Hobby: $hobby');

  int level = 1;
  bool playAgain = true;

// while loop
  while (playAgain) {
    bool passedLevel = playLevel(level);
    if (passedLevel) {
      print('You\'re the baddest!');
      level++;
      if (level > 7) {
        print('Congratulations! You\'ve completed all levels!');
        break;
      }
    } else {
      print('You\'ve got this!');
    }

    print('\nDo you want to play again? (yes/no)');
    String choice = stdin.readLineSync()!.toLowerCase();
    if (choice != 'yes') {
      playAgain = false;
    }
  }

  print('Thank you for playing Math Quiz Adventure!');
}

bool playLevel(int level) {
  print('\n--- Level $level: ${getOperation(level)} ---');

  int correctAnswers = 0;
  for (int i = 1; i <= 3; i++) {    // ensures there are only 3 questions 
    int num1 = getRandomNumber();   // the computer generates random numbers for mathematical operations 
    int num2 = getRandomNumber();
    int result = calculateResult(num1, num2, level);

    print('\nQuestion $i: What is $num1 ${getOperationSymbol(level)} $num2?');
    print('Enter your answer:');
    double answer = double.parse(stdin.readLineSync()!);

// checking if the answer provided by the user is correct or not
    if (answer == result) {
      print('Correct!');
      correctAnswers++;
    } else {
      print('Incorrect. The correct answer is $result.');
    }
  }

  return correctAnswers == 3;
}

String getOperation(int level) {
  switch (level) {
    case 1:
      return 'Addition';
    case 2:
      return 'Subtraction';
    case 3:
      return 'Multiplication';
    case 4:
      return 'Division';
    case 5:
      return 'Square';
    case 6:
      return 'Square Root';
    case 7:
      return 'Power';
    default:
      return 'Unknown';
  }
}

//symbols for basic mathematical operations

String getOperationSymbol(int level) {
  switch (level) {
    case 1:
      return '+';
    case 2:
      return '-';
    case 3:
      return '×';
    case 4:
      return '÷';
    case 5:
      return '^2';
    case 6:
      return '√';
    case 7:
      return '^';
    default:
      return '?';
  }
}

int getRandomNumber() {
  return Random().nextInt(1000);
}

int calculateResult(int num1, int num2, int level) {
  switch (level) {
    case 1:
      return num1 + num2;
    case 2:
      return num1 - num2;
    case 3:
      return num1 * num2;
    case 4:
      return num1 ~/ num2;
    case 5:
      return num1 * num1;
    case 6:
      return sqrt(num1).toInt();
    case 7:
      return pow(num1, num2).toInt();
    default:
      return 0;
  }
}