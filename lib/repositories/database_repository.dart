import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:show_runner/repositories/abstract_database_repository.dart';

class DatabaseRepository implements AbstractDatabaseRepository {
  DatabaseRepository({FirebaseFirestore? database})
      : _database = database ?? FirebaseFirestore.instance;

  final FirebaseFirestore _database;
}
