class Student {
  String firstName;
  String lastName;
  String course;
  int score;

  Student(
    this.firstName,
    this.lastName,
    this.course,
    this.score,
  );

  factory Student.fromMapJson(Map<String, dynamic> jsonMapObjcet) {
    return Student(
      jsonMapObjcet['first_name'],
      jsonMapObjcet['last_name'],
      jsonMapObjcet['course'],
      jsonMapObjcet['score'],
    );
  }
}
