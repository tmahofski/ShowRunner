part of 'create_show_bloc.dart';

abstract class CreateShowEvent extends Equatable {
  const CreateShowEvent();

  @override
  List<Object> get props => [];
}

class ShowNameChanged extends CreateShowEvent {
  const ShowNameChanged({
    required this.showName,
  });

  final String showName;

  @override
  List<Object> get props => [
        showName,
      ];
}

class ShowDescriptionChanged extends CreateShowEvent {
  const ShowDescriptionChanged({
    required this.showDescription,
  });

  final String showDescription;

  @override
  List<Object> get props => [
        showDescription,
      ];
}

class ShowLocationChanged extends CreateShowEvent {
  const ShowLocationChanged({
    required this.showLocation,
  });

  final String showLocation;

  @override
  List<Object> get props => [
        showLocation,
      ];
}

class ShowDatesChanged extends CreateShowEvent {
  const ShowDatesChanged({
    required this.showDates,
  });

  final String showDates;

  @override
  List<Object> get props => [
        showDates,
      ];
}

class ShowTimesChanged extends CreateShowEvent {
  const ShowTimesChanged({
    required this.showTimes,
  });

  final String showTimes;

  @override
  List<Object> get props => [
        showTimes,
      ];
}

class OtherOwnersChanged extends CreateShowEvent {
  const OtherOwnersChanged({
    required this.otherOwners,
  });

  final String otherOwners;

  @override
  List<Object> get props => [
        otherOwners,
      ];
}

class OtherStaffChanged extends CreateShowEvent {
  const OtherStaffChanged({
    required this.otherStaff,
  });

  final String otherStaff;

  @override
  List<Object> get props => [
        otherStaff,
      ];
}

class CreateShowSubmitButtonPressed extends CreateShowEvent {}
