import 'package:hive/hive.dart';

part 'some_data_db.g.dart';

@HiveType(typeId: 0)
class SomeDataDb extends HiveObject{
  @HiveField(0)
  String email;

  @HiveField(1)
  String difficulty;

  SomeDataDb({required this.email, required this.difficulty});
}