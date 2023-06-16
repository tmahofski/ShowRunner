import 'package:equatable/equatable.dart';

class ShowName extends Equatable {
  const ShowName({
    required this.showName,
  });

  final String showName;

  bool isValid() {
    return true;
  }

  @override
  List<Object?> get props => [
        showName,
      ];
}
