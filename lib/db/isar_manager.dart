import 'dart:async';
import 'package:isar/isar.dart';
import 'package:isar_flutter_libs/isar_flutter_libs.dart';
import 'package:path_provider/path_provider.dart';

class IsarManager {
  static final IsarManager _instance = IsarManager._internal();
  Isar? _isar;
  List<CollectionSchema>? _databaseSchema;

  // Private constructor
  IsarManager._internal();

  // Static factory
  static IsarManager get instance => _instance;

  // Initialize Isar with a database schema
  Future<void> init(List<CollectionSchema> databaseSchema) async {
    if (_isar == null) {
      _databaseSchema = databaseSchema;
      _isar = await _initIsar(databaseSchema);
    }
  }

  // Getter for the Isar instance
  Isar get isar {
    if (_isar == null) {
      throw Exception(
          'IsarManager has not been initialized. Call init() with a database schema before accessing the Isar instance.');
    }
    return _isar!;
  }

  // Initialize Isar database
  Future<Isar> _initIsar(List<CollectionSchema> databaseSchema) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final isar = await Isar.open(databaseSchema, directory: path);
    return isar;
  }
}
