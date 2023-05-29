import 'package:equatable/equatable.dart';

class Ring extends Equatable {
  const Ring({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  factory Ring.fromJson(Map<String, dynamic> json) {
    final String name = json['name'];
    final String description = json['description'];

    return Ring(
      name: name,
      description: description,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['name'] = name;
    json['description'] = description;

    return json;
  }

  @override
  List<Object?> get props => [
        name,
        description,
      ];
}
