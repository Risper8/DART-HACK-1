import 'dart:io';
void main(){

  // Prompt the user to enter their name, age, school and hobby
  print("Enter your name: ");
  String name = stdin.readLineSync()!;   // reads the input from the user and assigns it to the variable name

  print("Enter your age: ");
  int age = int.parse(stdin.readLineSync()!); // reads the input from the user and assigns it to the variable age


  print("Enter your school: ");
   String school = stdin.readLineSync()!; // reads the input from the user and assigns it to the variable school


  print("Enter your hobby: ");
  String hobby = stdin.readLineSync()!; // reads the input from the user and assigns it to the variable hobby



 print('My name is $name. I am $age years old and I study at $school. My hobby is $hobby.');
}
