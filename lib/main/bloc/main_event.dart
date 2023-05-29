part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class AddShow extends MainEvent {
  const AddShow({required this.show});

  final Show show;

  @override
  List<Object> get props => [show];
}

class GetAllShows extends MainEvent {
  const GetAllShows();

  @override
  List<Object> get props => super.props;
}

class ReloadShows extends MainEvent {
  const ReloadShows({
    required this.shows,
  });

  final List<Show> shows;

  @override
  List<Object> get props => [shows];
}
