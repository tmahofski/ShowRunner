part of 'create_show_bloc.dart';

abstract class CreateShowState extends Equatable {
  const CreateShowState({
    required this.showName,
    required this.showDescription,
    required this.showLocation,
    required this.showDates,
    required this.showTimes,
    required this.otherOwners,
    required this.otherStaff,
  });

  final ShowName showName;
  final ShowDescription showDescription;
  final ShowLocation showLocation;
  final String showDates;
  final String showTimes;
  final String otherOwners;
  final String otherStaff;

  @override
  List<Object> get props => [
        showName,
        showDescription,
        showLocation,
        showDates,
        showTimes,
        otherOwners,
        otherStaff,
      ];
}

class CreateShowInitial extends CreateShowState {
  const CreateShowInitial({
    super.showName = const ShowName(showName: ''),
    super.showDescription = const ShowDescription(showDescription: ''),
    super.showLocation = const ShowLocation(showLocation: ''),
    super.showDates = '',
    super.showTimes = '',
    super.otherOwners = '',
    super.otherStaff = '',
  });
}

class CreateShowInProgress extends CreateShowState {
  const CreateShowInProgress({
    required super.showName,
    required super.showDescription,
    required super.showLocation,
    required super.showDates,
    required super.showTimes,
    required super.otherOwners,
    required super.otherStaff,
  });

  factory CreateShowInProgress.copyWith({
    required CreateShowState previousState,
    ShowName? showName,
    ShowDescription? showDescription,
    ShowLocation? showLocation,
    String? showDates,
    String? showTimes,
    String? otherOwners,
    String? otherStaff,
  }) {
    return CreateShowInProgress(
      showName: showName ?? previousState.showName,
      showDescription: showDescription ?? previousState.showDescription,
      showLocation: showLocation ?? previousState.showLocation,
      showDates: showDates ?? previousState.showDates,
      showTimes: showTimes ?? previousState.showTimes,
      otherOwners: otherOwners ?? previousState.otherOwners,
      otherStaff: otherStaff ?? previousState.otherStaff,
    );
  }
}

class CreateShowLoading extends CreateShowState {
  const CreateShowLoading({
    required super.showName,
    required super.showDescription,
    required super.showLocation,
    required super.showDates,
    required super.showTimes,
    required super.otherOwners,
    required super.otherStaff,
  });

  factory CreateShowLoading.copyWith({
    required CreateShowState previousState,
    ShowName? showName,
    ShowDescription? showDescription,
    ShowLocation? showLocation,
    String? showDates,
    String? showTimes,
    String? otherOwners,
    String? otherStaff,
  }) {
    return CreateShowLoading(
      showName: showName ?? previousState.showName,
      showDescription: showDescription ?? previousState.showDescription,
      showLocation: showLocation ?? previousState.showLocation,
      showDates: showDates ?? previousState.showDates,
      showTimes: showTimes ?? previousState.showTimes,
      otherOwners: otherOwners ?? previousState.otherOwners,
      otherStaff: otherStaff ?? previousState.otherStaff,
    );
  }
}

class CreateShowSuccess extends CreateShowState {
  const CreateShowSuccess({
    required super.showName,
    required super.showDescription,
    required super.showLocation,
    required super.showDates,
    required super.showTimes,
    required super.otherOwners,
    required super.otherStaff,
  });

  factory CreateShowSuccess.copyWith({
    required CreateShowState previousState,
    ShowName? showName,
    ShowDescription? showDescription,
    ShowLocation? showLocation,
    String? showDates,
    String? showTimes,
    String? otherOwners,
    String? otherStaff,
  }) {
    return CreateShowSuccess(
      showName: showName ?? previousState.showName,
      showDescription: showDescription ?? previousState.showDescription,
      showLocation: showLocation ?? previousState.showLocation,
      showDates: showDates ?? previousState.showDates,
      showTimes: showTimes ?? previousState.showTimes,
      otherOwners: otherOwners ?? previousState.otherOwners,
      otherStaff: otherStaff ?? previousState.otherStaff,
    );
  }
}

class CreateShowFailure extends CreateShowState {
  const CreateShowFailure({
    required super.showName,
    required super.showDescription,
    required super.showLocation,
    required super.showDates,
    required super.showTimes,
    required super.otherOwners,
    required super.otherStaff,
  });

  factory CreateShowFailure.copyWith({
    required CreateShowState previousState,
    ShowName? showName,
    ShowDescription? showDescription,
    ShowLocation? showLocation,
    String? showDates,
    String? showTimes,
    String? otherOwners,
    String? otherStaff,
  }) {
    return CreateShowFailure(
      showName: showName ?? previousState.showName,
      showDescription: showDescription ?? previousState.showDescription,
      showLocation: showLocation ?? previousState.showLocation,
      showDates: showDates ?? previousState.showDates,
      showTimes: showTimes ?? previousState.showTimes,
      otherOwners: otherOwners ?? previousState.otherOwners,
      otherStaff: otherStaff ?? previousState.otherStaff,
    );
  }
}
