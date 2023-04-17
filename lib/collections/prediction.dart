import 'package:isar/isar.dart';
import 'package:isar_watcher/collections/meal.dart';
part 'prediction.g.dart';

@collection
class Prediction {
  String label;
  DateTime created;
  Id id = Isar.autoIncrement;
  String model;

  final meal = IsarLink<Meal>();

  Prediction({
    required this.label,
    required this.created,
    required this.model,
  });
}