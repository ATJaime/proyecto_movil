class SomeData{
  int? id;
  final String email;
  final String difficulty;

  SomeData({required this.email, required this.difficulty});
  SomeData.id({this.id, required this.email, required this.difficulty});
}