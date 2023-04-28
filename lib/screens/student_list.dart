import 'package:flutter/material.dart';
import 'package:student_course_list/data/constants/custom_color.dart';
import 'package:student_course_list/screens/add_student.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: CustomColor.greenColor,
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return AddStudent();
              },
            ),
          );
          setState(() {});
        },
        label: Row(
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
            ),
            Text(
              'Add Student',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColor.blackColor,
        elevation: 0,
        title: Text(
          'Student Course List',
          style: TextStyle(color: CustomColor.greenColor),
        ),
        centerTitle: true,
      ),
      backgroundColor: CustomColor.blackColor,
      body: SafeArea(
        child: ListView.builder(
          itemCount: studentList!.length,
          itemBuilder: (context, index) {
            return _getItemList(studentList![index]);
          },
        ),
      ),
    );
  }

  Widget _getItemList(Student student) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        child: Center(
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: CustomColor.greyColor,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                student.firstName.characters.first,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      title: Text(
        '${student.firstName} ${student.lastName}',
        style: TextStyle(color: CustomColor.greenColor),
      ),
      subtitle: Text(
        student.course,
        style: TextStyle(color: CustomColor.greyColor),
      ),
      trailing: SizedBox(
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bar_chart_rounded,
              color: CustomColor.greyColor,
            ),
            Text(
              student.score.toString(),
              style: TextStyle(color: CustomColor.redColor),
            ),
          ],
        ),
      ),
    );
  }
}
