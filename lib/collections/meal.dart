import 'package:isar/isar.dart';
import 'package:isar_watcher/collections/prediction.dart';
part 'meal.g.dart';

@collection
class Meal {
  String label;
  DateTime created;
  DateTime updated;
  Id id = Isar.autoIncrement;

  final prediction = IsarLink<Prediction>();

  Meal({
    required this.label,
    required this.created,
    required this.updated,
  });
}