import 'package:equatable/equatable.dart';

class Attendee extends Equatable {
  const Attendee();

  factory Attendee.fromJson(Map<String, dynamic> json) {
    return const Attendee();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    return json;
  }

  @override
  List<Object?> get props => [];
}
