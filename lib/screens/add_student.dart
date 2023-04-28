import 'package:flutter/material.dart';
import 'package:student_course_list/data/constants/custom_color.dart';

class AddStudent extends StatefulWidget {
  AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.blackColor,
      body: SafeArea(
        child: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}
