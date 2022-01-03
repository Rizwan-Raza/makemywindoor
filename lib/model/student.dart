class Student {
  int roll;
  String name;
  String course;
  String branch;

  Student(this.roll, this.name, this.course, this.branch);

  @override
  String toString() {
    return 'Student{roll: $roll, name: $name, course: $course, branch: $branch}';
  }

  Map<String, dynamic> toMap() {
    return {
      'roll': roll,
      'name': name,
      'course': course,
      'branch': branch,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      map['roll'],
      map['name'],
      map['course'],
      map['branch'],
    );
  }

  /* Here is the explanation for the code above:
1. The factory keyword is used to define a factory constructor.
   A factory constructor is called with the new keyword, and it returns a new instance of the class. */
  factory Student.empty() {
    return Student(0, '', '', '');
  }

  Student.fromJson(Map<String, dynamic> json)
      : roll = json['roll'],
        name = json['name'],
        course = json['course'],
        branch = json['branch'];
}
