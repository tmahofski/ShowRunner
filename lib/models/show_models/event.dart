import 'package:equatable/equatable.dart';
import 'package:show_runner/models/show_models/ring.dart';

class Event extends Equatable {
  const Event({
    required this.name,
    required this.requirements,
    required this.description,
    required this.ring,
  });

  final String name;
  final String requirements;
  final String description;
  final Ring ring;

  factory Event.fromJson(Map<String, dynamic> json) {
    final String name = json['name'];
    final String requirements = json['requirements'];
    final String description = json['description'];
    final Ring ring = Ring.fromJson(json['ring']);

    return Event(
      name: name,
      requirements: requirements,
      description: description,
      ring: ring,
    );
  }

  @override
  List<Object?> get props => [
        name,
        requirements,
        description,
        ring,
      ];
}
