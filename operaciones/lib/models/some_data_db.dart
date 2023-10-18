import 'package:hive/hive.dart';

part 'some_data_db.g.dart';

@HiveType(typeId: 0)
class SomeDataDb extends HiveObject{
  @HiveField(0)
  String name;

  @HiveField(1)
  String grade;
  
  @HiveField(2)
  String school;
  

  @HiveField(3)
  List<dynamic> difficulty;

  SomeDataDb({required this.name, required this.grade, required this.school, required this.difficulty});
}