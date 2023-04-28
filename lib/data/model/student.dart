class Student {
  int id;
  String firstName;
  String lastName;
  String course;
  int score;
  String createdAt;
  String updatedAt;

  Student(this.id, this.firstName, this.lastName, this.course, this.score,
      this.createdAt, this.updatedAt);

  factory Student.fromMapJson(Map<String, dynamic> jsonMapObjcet) {
    return Student(
      jsonMapObjcet['id'],
      jsonMapObjcet['first_name'],
      jsonMapObjcet['last_name'],
      jsonMapObjcet['course'],
      jsonMapObjcet['score'],
      jsonMapObjcet['created_at'],
      jsonMapObjcet['updated_at'],
    );
  }
}
