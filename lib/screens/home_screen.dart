import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:student_course_list/data/constants/custom_color.dart';
import 'package:student_course_list/data/model/student.dart';
import 'package:student_course_list/screens/student_list.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key, this.studentList}) : super(key: key);
  List<Student>? studentList;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.blackColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitChasingDots(
              color: Colors.white,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }

  Future<void> getData() async {
    var response =
        await Dio().get('http://expertdevelopers.ir/api/v1/experts/student');

    List<Student> studentList = response.data
        .map<Student>((jsonMapObjcet) => Student.fromMapJson(jsonMapObjcet))
        .toList()
        .cast<Student>();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return StudentList(studentList: studentList);
        },
      ),
    );
  }
}
