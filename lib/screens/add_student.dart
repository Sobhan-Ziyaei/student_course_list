import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:student_course_list/data/constants/custom_color.dart';
import 'package:student_course_list/screens/student_list.dart';

import '../data/model/student.dart';

class AddStudent extends StatefulWidget {
  AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  FocusNode negahban3 = FocusNode();
  FocusNode negahban4 = FocusNode();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();

  @override
  void initState() {
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: CustomColor.greenColor,
        onPressed: () async {
          final newStudent = await getNewData(
            _firstNameController.text,
            _lastNameController.text,
            _courseController.text,
            int.parse(_scoreController.text),
          );
          Navigator.pop(context, newStudent);
        },
        label: Row(
          children: [
            Icon(Icons.check),
            Text('Save'),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: TextField(
                controller: _firstNameController,
                focusNode: negahban1,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  labelText: 'First Name',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: negahban1.hasFocus
                        ? Color(0xff18DAA3)
                        : Color(0xffC5C5C5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide:
                        BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 3,
                      color: Color(0xff18DAA3),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: TextField(
                controller: _lastNameController,
                focusNode: negahban2,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  labelText: 'Last Name',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: negahban2.hasFocus
                        ? Color(0xff18DAA3)
                        : Color(0xffC5C5C5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide:
                        BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 3,
                      color: Color(0xff18DAA3),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: TextField(
                controller: _courseController,
                focusNode: negahban3,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  labelText: 'Course',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: negahban2.hasFocus
                        ? Color(0xff18DAA3)
                        : Color(0xffC5C5C5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide:
                        BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 3,
                      color: Color(0xff18DAA3),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _scoreController,
                focusNode: negahban4,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  labelText: 'Score',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: negahban2.hasFocus
                        ? Color(0xff18DAA3)
                        : Color(0xffC5C5C5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide:
                        BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 3,
                      color: Color(0xff18DAA3),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<List<Student>> getNewData(
      String firstName, String lastName, String course, int score) async {
    var response =
        await Dio().post('http://expertdevelopers.ir/api/v1/experts/student');

    List<Student> studentList = response.data
        .map<Student>((jsonMapObjcet) => Student.fromMapJson(jsonMapObjcet))
        .toList()
        .cast<Student>();
    
    return studentList;
  }
}
