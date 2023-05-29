import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:show_runner/models/show_models/show.dart';
import 'package:show_runner/repositories/abstract_database_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

List<Show> tempShows = [
  Show(
    name: 'Temp Name 1',
    description: 'Temp Description 1',
    startDate: DateTime.now(),
    startTime: TimeOfDay.now(),
    endDate: DateTime.now(),
    endTime: TimeOfDay.now(),
    staff: [],
    rings: [],
    events: [],
    attendees: [],
  ),
  Show(
    name: 'Temp Name 1',
    description: 'Temp Description 1',
    startDate: DateTime.now(),
    startTime: TimeOfDay.now(),
    endDate: DateTime.now(),
    endTime: TimeOfDay.now(),
    staff: [],
    rings: [],
    events: [],
    attendees: [],
  ),
  Show(
    name: 'Temp Name 1',
    description: 'Temp Description 1',
    startDate: DateTime.now(),
    startTime: TimeOfDay.now(),
    endDate: DateTime.now(),
    endTime: TimeOfDay.now(),
    staff: [],
    rings: [],
    events: [],
    attendees: [],
  ),
  Show(
    name: 'Temp Name 1',
    description: 'Temp Description 1',
    startDate: DateTime.now(),
    startTime: TimeOfDay.now(),
    endDate: DateTime.now(),
    endTime: TimeOfDay.now(),
    staff: [],
    rings: [],
    events: [],
    attendees: [],
  ),
  Show(
    name: 'Temp Name 1',
    description: 'Temp Description 1',
    startDate: DateTime.now(),
    startTime: TimeOfDay.now(),
    endDate: DateTime.now(),
    endTime: TimeOfDay.now(),
    staff: [],
    rings: [],
    events: [],
    attendees: [],
  ),
  Show(
    name: 'Temp Name 1',
    description: 'Temp Description 1',
    startDate: DateTime.now(),
    startTime: TimeOfDay.now(),
    endDate: DateTime.now(),
    endTime: TimeOfDay.now(),
    staff: [],
    rings: [],
    events: [],
    attendees: [],
  ),
  Show(
    name: 'Temp Name 1',
    description: 'Temp Description 1',
    startDate: DateTime.now(),
    startTime: TimeOfDay.now(),
    endDate: DateTime.now(),
    endTime: TimeOfDay.now(),
    staff: [],
    rings: [],
    events: [],
    attendees: [],
  ),
  Show(
    name: 'Temp Name 1',
    description: 'Temp Description 1',
    startDate: DateTime.now(),
    startTime: TimeOfDay.now(),
    endDate: DateTime.now(),
    endTime: TimeOfDay.now(),
    staff: [],
    rings: [],
    events: [],
    attendees: [],
  ),
];

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({required AbstractDatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(MainInitial(
          upcomingShows: tempShows,
        )) {
    on<AddShow>(_onAddShow);
    on<GetAllShows>(_onGetAllShows);
  }

  //TODO: Setup listener to database to display upcoming shows
  final AbstractDatabaseRepository _databaseRepository;

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

    shows.forEach(print);
  }
}
