import 'package:equatable/equatable.dart';

class ShowDescription extends Equatable {
  const ShowDescription({
    required this.showDescription,
  });

  final String showDescription;

  bool isValid() {
    return true;
  }

  @override
  List<Object?> get props => [
        showDescription,
      ];
}
