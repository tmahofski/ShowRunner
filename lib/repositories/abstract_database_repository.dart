import 'package:show_runner/models/show_models/show.dart';

abstract class AbstractDatabaseRepository {
  //* Create
  Future<void> addShowToDatabase({
    required Show show,
  });

  //* Read
  Future<List<Show>> getAllShowsFromDatabase();

  Stream<List<Show>> showStream();

  //* Update
  Future<void> updateShowInDatabase({
    required Show show,
  });

  //* Delete
  Future<void> deleteShowFromDatabase({
    required Show show,
  });
}
