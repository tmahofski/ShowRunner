part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {
  const MainInitial({
    required this.upcomingShows,
  });

  final List<Show> upcomingShows;

  @override
  List<Object> get props => [upcomingShows];
}
