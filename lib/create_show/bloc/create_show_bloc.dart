import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:show_runner/create_show/models/show_description.dart';
import 'package:show_runner/create_show/models/show_location.dart';
import 'package:show_runner/create_show/models/show_name.dart';
import 'package:show_runner/models/show_models/show.dart';
import 'package:show_runner/repositories/abstract_database_repository.dart';

part 'create_show_event.dart';
part 'create_show_state.dart';

class CreateShowBloc extends Bloc<CreateShowEvent, CreateShowState> {
  CreateShowBloc({
    required AbstractDatabaseRepository databaseRepository,
  })  : _databaseRepository = databaseRepository,
        super(const CreateShowInitial()) {
    on<ShowNameChanged>(_onShowNameChanged);
    on<ShowDescriptionChanged>(_onShowDescriptionChanged);
    on<ShowLocationChanged>(_onShowLocationChanged);
    on<ShowDatesChanged>(_onShowDatesChanged);
    on<ShowTimesChanged>(_onShowTimesChanged);
    on<OtherOwnersChanged>(_onOtherOwnersChanged);
    on<OtherStaffChanged>(_onOtherStaffChanged);
    on<CreateShowSubmitButtonPressed>(_onCreateShowSubmitButtonPressed);
  }

  final AbstractDatabaseRepository _databaseRepository;

  void _onShowNameChanged(
      ShowNameChanged event, Emitter<CreateShowState> emit) {
    CreateShowInProgress newState = CreateShowInProgress.copyWith(
      previousState: state,
      showName: ShowName(showName: event.showName),
    );
    emit(newState);
  }

  void _onShowDescriptionChanged(
      ShowDescriptionChanged event, Emitter<CreateShowState> emit) {
    CreateShowInProgress newState = CreateShowInProgress.copyWith(
      previousState: state,
      showDescription: ShowDescription(showDescription: event.showDescription),
    );
    emit(newState);
  }

  void _onShowLocationChanged(
      ShowLocationChanged event, Emitter<CreateShowState> emit) {
    CreateShowInProgress newState = CreateShowInProgress.copyWith(
        previousState: state,
        showLocation: ShowLocation(showLocation: event.showLocation));
    emit(newState);
  }

  void _onShowDatesChanged(
      ShowDatesChanged event, Emitter<CreateShowState> emit) {
    CreateShowInProgress newState = CreateShowInProgress.copyWith(
      previousState: state,
      showDates: event.showDates,
    );
    emit(newState);
  }

  void _onShowTimesChanged(
      ShowTimesChanged event, Emitter<CreateShowState> emit) {
    CreateShowInProgress newState = CreateShowInProgress.copyWith(
      previousState: state,
      showTimes: event.showTimes,
    );
    emit(newState);
  }

  void _onOtherOwnersChanged(
      OtherOwnersChanged event, Emitter<CreateShowState> emit) {
    CreateShowInProgress newState = CreateShowInProgress.copyWith(
      previousState: state,
      otherOwners: event.otherOwners,
    );
    emit(newState);
  }

  void _onOtherStaffChanged(
      OtherStaffChanged event, Emitter<CreateShowState> emit) {
    CreateShowInProgress newState = CreateShowInProgress.copyWith(
      previousState: state,
      otherStaff: event.otherStaff,
    );
    emit(newState);
  }

  Future<void> _onCreateShowSubmitButtonPressed(
      CreateShowSubmitButtonPressed event,
      Emitter<CreateShowState> emit) async {
    CreateShowLoading newState =
        CreateShowLoading.copyWith(previousState: state);

    emit(newState);

    try {
      Show show = Show(
        name: state.showName.showName,
        description: state.showDescription.showDescription,
        startDate: DateTime.now(),
        startTime: TimeOfDay.now(),
        endDate: DateTime.now().add(const Duration(days: 10)),
        endTime: TimeOfDay.now(),
        staff: const [],
        rings: const [],
        events: const [],
        attendees: const [],
      );
      _databaseRepository.addShowToDatabase(show: show);
      CreateShowSuccess successState =
          CreateShowSuccess.copyWith(previousState: state);

      emit(successState);
    } on Exception catch (_) {
      CreateShowFailure failedState =
          CreateShowFailure.copyWith(previousState: state);
      emit(failedState);
    }
  }
}
