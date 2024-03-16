import 'dart:io';    // handles input and output operations
import 'dart:math';  //  for performing common mathematical operations.

void main() {                              // entry point of the program
  // Prompt the user to enter a number
  print('Enter a number:');
  dynamic input = stdin.readLineSync(); //reads the input from the console and assigns it to the variable input
  if (!isNumeric(input)) {
    print('Invalid input! Please enter a number.');
    tryAgain();
    return;
  }
  double num = double.parse(input);

  // Prompt the user to choose an operation
  print('Choose an operation:');
  print('1. Addition');
  print('2. Subtraction');
  print('3. Multiplication');
  print('4. Division');
  print('5. Square root');
  print('6. Square');
  print('7. Power');
  String operation = stdin.readLineSync()!;

  // Perform the selected operation
  double result = 0;
  switch (operation) {
    case '1':
      result = performAddition(num);
      break;
    case '2':
      result = performSubtraction(num);
      break;
    case '3':
      result = performMultiplication(num);
      break;
    case '4':
      result = performDivision(num);
      break;
    case '5':
      result = performSquareRoot(num);
      break;
    case '6':
      result = performSquare(num);
      break;
    case '7':
      result = performPower(num);
      break;
    default:
      print('Invalid operation!');
      return;
  }

  // Print the result
  print('Result: $result');
}

bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

void tryAgain() {
  print('Do you want to try again? (yes/no)');
  String choice = stdin.readLineSync()!;
  if (choice.toLowerCase() == 'yes') {
    main(); // Restart the main function
  } else {
    print('Goodbye!');
    exit(0);
  }
}

// Addition
double performAddition(double num) {
  print('Enter the second number:');
  dynamic input2 = stdin.readLineSync();
  if (!isNumeric(input2)) {
    print('Invalid input! Please enter a number.');
    tryAgain();
  }
  double num2 = double.parse(input2);
  return num + num2;
}

// Subtraction
double performSubtraction(double num) {
  print('Enter the second number:');
  dynamic input2 = stdin.readLineSync();
  if (!isNumeric(input2)) {
    print('Invalid input! Please enter a number.');
    tryAgain();
  }
  double num2 = double.parse(input2);
  return num - num2;
}

// Multiplication
double performMultiplication(double num) {
  print('Enter the second number:');
  dynamic input2 = stdin.readLineSync();
  if (!isNumeric(input2)) {
    print('Invalid input! Please enter a number.');
    tryAgain();
  }
  double num2 = double.parse(input2);
  return num * num2;
}

// Division
double performDivision(double num) {
  print('Enter the second number:');
  dynamic input2 = stdin.readLineSync();
  if (!isNumeric(input2)) {
    print('Invalid input! Please enter a number.');
    tryAgain();
  }
  double num2 = double.parse(input2);
  if (num2 == 0) {
    print('Error: Division by zero!');
    tryAgain();
  }
  return num / num2;
}

// Squareroot
double performSquareRoot(double num) {
  if (num < 0) {
    print('Error: Cannot compute square root of a negative number!');
    tryAgain();
  }
  return sqrt(num);
}

// Square
double performSquare(double num) {
  return num * num;
}

// Power
dynamic performPower(double num) {
  print('Enter the exponent:');
  dynamic input2 = stdin.readLineSync();
  if (!isNumeric(input2)) {
    print('Invalid input! Please enter a number.');
    tryAgain(); //
  }
  double exponent = double.parse(input2);
  return pow(num, exponent);
}
