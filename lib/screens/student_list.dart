import 'package:flutter/material.dart';

import '../data/model/student.dart';

class StudentList extends StatefulWidget {
  StudentList({Key? key, required this.studentList}) : super(key: key);
  List<Student>? studentList;
  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<Student>? studentList;

  @override
  void initState() {
    super.initState();
    studentList = widget.studentList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: studentList!.length,
          itemBuilder: (context, index) {
            return Text(studentList![index].firstName);
          },
        ),
      ),
    );
  }
}
