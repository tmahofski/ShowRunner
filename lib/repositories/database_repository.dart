import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:show_runner/models/show_models/show.dart';
import 'package:show_runner/repositories/abstract_database_repository.dart';

class DatabaseRepository implements AbstractDatabaseRepository {
  DatabaseRepository({FirebaseFirestore? database})
      : _database = database ?? FirebaseFirestore.instance;

  final FirebaseFirestore _database;

  final String showCollectionPath = 'shows';

  @override
  Future<void> addShowToDatabase({
    required Show show,
  }) async {
    DocumentReference ref =
        await _database.collection(showCollectionPath).add(show.toJson());
    //Note: this is how to get the doc id if we need in the future.
    String showId = ref.id;
    Show updatedShow = show.copyWith(id: showId);
    await updateShowInDatabase(
      show: updatedShow,
    );
  }

  @override
  Future<List<Show>> getAllShowsFromDatabase() async {
    List<Show> shows = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _database.collection(showCollectionPath).get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = snapshot.docs;

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in docs) {
      Show show = Show.fromJson(doc.data());

      shows.add(show);
    }

    return shows;
  }

  @override
  Future<void> deleteShowFromDatabase({
    required Show show,
  }) async {
    await _database.collection(showCollectionPath).doc(show.id).delete();
  }

  @override
  Future<void> updateShowInDatabase({
    required Show show,
  }) async {
    await _database
        .collection(showCollectionPath)
        .doc(show.id)
        .set(show.toJson());
  }

  Stream<Show> showStream() {
    return _database
        .collection(showCollectionPath)
        .snapshots()
        .map((event) => null);
  }
}
