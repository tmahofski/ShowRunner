import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:show_runner/repositories/abstract_database_repository.dart';

class DatabaseRepository implements AbstractDatabaseRepository {
  DatabaseRepository({FirebaseFirestore? database})
      : _database = database ?? FirebaseFirestore.instance;

  final FirebaseFirestore _database;

  @override
  Future<void> addShowToDatabase() {
    // TODO: implement addShowToDatabase
    throw UnimplementedError();
  }

  @override
  Future<void> deleteShowFromDatabase(String showId) {
    // TODO: implement deleteShowFromDatabase
    throw UnimplementedError();
  }

  @override
  Future<void> getAllShowsFromDatabase() {
    // TODO: implement getAllShowsFromDatabase
    throw UnimplementedError();
  }

  @override
  Future<void> updateShowInDatabase(String showId) {
    // TODO: implement updateShowInDatabase
    throw UnimplementedError();
  }
}
