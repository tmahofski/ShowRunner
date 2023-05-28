abstract class AbstractDatabaseRepository {
  //* Create
  Future<void> addShowToDatabase();

  //* Read
  Future<void> getAllShowsFromDatabase();

  //* Update
  Future<void> updateShowInDatabase(String showId);

  //* Delete
  Future<void> deleteShowFromDatabase(String showId);
}
