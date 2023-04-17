import 'package:isar/isar.dart';
part 'audit.g.dart';

@collection
class Audit {
  Id id = Isar.autoIncrement;
  int mealId;
  String predictedLabel;
  String userAcceptedLabel;
  int predictionId;

  Audit({
    required this.mealId,
    required this.predictedLabel,
    required this.userAcceptedLabel,
    required this.predictionId,
  });
}
