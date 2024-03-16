import 'dart:io'; // for inpu and output operations

void main() {
  // Interact with the student to get their favorite subjects
  List<String> subjects = getFavoriteSubjects();

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

    // Interact with the student based on the grading result
    chatWithStudent(grade);
  }
}

List<String> getFavoriteSubjects() {
  List<String> subjects = [];
  print('Enter your 3 favorite subjects:');
  for (int i = 0; i < 3; i++) {
    print('Subject ${i + 1}:');
    String subject = stdin.readLineSync()!;
    subjects.add(subject);
  }
  return subjects;
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
  } else if (average >= 45) {
    return 'Average';
  } else {
    return 'Fail';
  }
}

// support 
 
   void chatWithStudent(String grade) {
  // excellent student
  if (grade == 'Excellent') {
    print("Congratulations on your excellent performance!");
    print("What do you think contributed to your success?");
    String? successFactors = stdin.readLineSync();
    print("You can encourage and inspire others who didn't do as well by sharing your:");
    print("- Study habits and time management techniques.");
    print("- Strategies for staying focused and motivated.");
    print("- Positive mindset and resilience in the face of challenges.");
    print("You mentioned: $successFactors");
    
    // very good student
  } else if (grade == 'Very Good') {
    print("Well done on achieving a very good grade!");
    print("How do you feel about your performance?");
    String? feelings = stdin.readLineSync();
    print("You mentioned: $feelings");
    print("You can continue to strive for excellence in your studies!");

  // good student
  } else if (grade == 'Good') {
    print("You've received a good grade. Keep up the good work!");
    print("What do you think you could do to improve further?");
    String? improvements = stdin.readLineSync();
    print("You mentioned: $improvements");
     print("You're on the right track. Keep pushing yourself!");

     // average student
  } else if (grade == 'Average') {
    print("Your grade is average.");
    print("How do you feel about your performance?");
    String? feelings = stdin.readLineSync();
    print("You mentioned: $feelings");
     print("You can reflect on your study habits and consider seeking additional support."); 

     // failed student  
  } else {
    print("I'm sorry to hear that you received a lower grade.");
    print("How do you feel about your performance?");
    String? feelings = stdin.readLineSync();
    print("You mentioned: $feelings");
     print("Don't be discouraged. Use this as an opportunity to learn and improve.");
    print("You can try setting specific goals and seeking help from teachers or tutors.");
  }
}