import 'package:equatable/equatable.dart';

class ShowLocation extends Equatable {
  const ShowLocation({
    required this.showLocation,
  });

  final String showLocation;

  bool isValid() {
    return true;
  }

  @override
  List<Object?> get props => [
        showLocation,
      ];
}
