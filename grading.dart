import 'dart:io';   //provides input and output functions
void main() {                     // serves as the entry point of the program.
  List<String> subjects = [];     //declares an empty list to store the names of the user's favorite subjects

  // Prompt the user to enter their favorite subjects

  print('Enter your 3 favorite subjects:');  //prints a message to  prompt the user to enter their subjects.
  for (int i = 0; i < 3; i++) {
    print('Subject ${i + 1}:');
    String subject = stdin.readLineSync()!; //reads the inputand assigns it to the variable subject
    subjects.add(subject);
  }//

  // Calculate grades for each subject
  for (String subject in subjects) {
    print('\nSubject: $subject');  
    int cat1 = getScore('CAT 1');
    int cat2 = getScore('CAT 2');
    int exam = getScore('Final Exam');

    // Calculate average score
    double average = (cat1 + cat2) * 0.5 + exam;

    // Determine grade
    String grade = getGrade(average);

    // Print result
    print('Average Score: $average');
    print('Grade: $grade');
  }
}

int getScore(String type) {
  while (true) {
    try {
      print('Enter $type score:');
      String? input = stdin.readLineSync();
      int score = int.parse(input!);
      if (score < 0 || (type.contains('CAT') && score > 30) || (type.contains('Exam') && score > 70)) {
        throw FormatException();
      }
      return score;
    } on FormatException {
      print('Invalid input! Please enter a valid score.');
    }
  }
}

String getGrade(double average) {
  if (average >= 85) {
    return 'Excellent';
  } else if (average >= 75) {
    return 'Very Good';
  } else if (average >= 65) {
    return 'Good';
  } else {
    return 'Average';
  }
}