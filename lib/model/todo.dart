import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String startDate;
  @HiveField(3)
  String endDate;
  @HiveField(4)
  bool isComplete;

  TodoModel({
    this.id,
    this.title = '',
    this.startDate,
    this.endDate,
    this.isComplete = false,
  });
}
