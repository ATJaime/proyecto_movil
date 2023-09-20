class User {
  User({
    this.id,
    required this.name,
    required this.grade,
    required this.school,
  });

  int? id;
  String name;
  String grade;
  String school;

  String get userName => name;

  String get userGrade => grade;

  String get userSchool => school;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["Name"] ?? "someName",
        grade: json["Grade"] ?? "someGrade",
        school: json["School"] ?? "someSchool",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "name": name,
        "grade": grade,
        "school": school,
      };
}