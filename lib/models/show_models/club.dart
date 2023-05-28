import 'package:equatable/equatable.dart';
import 'package:show_runner/models/show_models/show.dart';
import 'package:show_runner/models/user.dart';

class Club extends Equatable {
  const Club({
    required this.owners,
    required this.show,
  });

  final List<User> owners;
  final Show show;

  @override
  List<Object?> get props => [
        owners,
        show,
      ];
}
