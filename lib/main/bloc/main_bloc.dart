import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:show_runner/models/show_models/show.dart';
import 'package:show_runner/repositories/abstract_database_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

List<Show> tempShows = [];

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({required AbstractDatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(MainInitial(
          upcomingShows: tempShows,
        )) {
    _showSubscription = _databaseRepository.showStream().listen((event) {
      add(ReloadShows(shows: event));
    });

    on<AddShow>(_onAddShow);
    on<GetAllShows>(_onGetAllShows);
    on<ReloadShows>(_onReloadShows);
  }

  final AbstractDatabaseRepository _databaseRepository;
  late final StreamSubscription<List<Show>> _showSubscription;

  @override
  Future<void> close() {
    _showSubscription.cancel();
    return super.close();
  }

  Future<void> _onAddShow(AddShow event, Emitter<MainState> emit) async {
    try {
      print('adding to db');
      await _databaseRepository.addShowToDatabase(show: event.show);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onGetAllShows(
      GetAllShows event, Emitter<MainState> emit) async {
    List<Show> shows = await _databaseRepository.getAllShowsFromDatabase();
  }

  void _onReloadShows(ReloadShows event, Emitter<MainState> emit) {
    emit(MainInitial(upcomingShows: event.shows));
  }
}
