class SomeData{
  int? id;
  final String name;
  final String grade;
  final String school;
  final List<dynamic> difficulty;

  SomeData({required this.name, required this.grade, required this.school, required this.difficulty});
  SomeData.id({this.id, required this.name, required this.grade, required this.school, required this.difficulty});
}