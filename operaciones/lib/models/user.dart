
class User {
  User({
    this.id,
    required this.name,
    required this.grade,
    required this.school,
    required this.difficulties,
  });

  int? id;
  String name;
  String grade;
  String school;
  List<dynamic> difficulties;

  String get Name => name;
  String get Grade => grade;
  String get School => school;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"] ?? "someName",
        grade: json["grade"] ?? "someGrade",
        school: json["school"] ?? "someSchool",
        difficulties: json["difficulties"] ?? "someDifficulties",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "name": name,
        "grade": grade,
        "school": school,
        "difficulties": difficulties
      };
}
