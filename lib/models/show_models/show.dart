import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:show_runner/models/show_models/event.dart';
import 'package:show_runner/models/show_models/ring.dart';
import 'package:show_runner/models/user.dart';

import 'attendee.dart';

class Show extends Equatable {
  const Show({
    required this.name,
    required this.description,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.staff,
    required this.rings,
    required this.events,
    required this.attendees,
  });

  final String name;
  final String description;
  final DateTime startDate;
  final TimeOfDay startTime;
  final DateTime endDate;
  final TimeOfDay? endTime;
  final List<User> staff;
  final List<Ring> rings;
  final List<Event> events;
  final List<Attendee> attendees;

  factory Show.fromJson(Map<String, dynamic> json) {
    final String name = json['name'];
    final String description = json['description'];
    final DateTime startDate = json['startDate'];
    final TimeOfDay startTime = json['startTime'];
    final DateTime endDate = json['endDate'];
    final TimeOfDay endTime =
        json.keys.contains('endTime') ? json['endTime'] : null;
    final List<User> staff =
        (json['staff'] as List).map((e) => User.fromJson(e)).toList();
    final List<Ring> rings =
        (json['rings'] as List).map((e) => Ring.fromJson(e)).toList();
    final List<Event> events =
        (json['events'] as List).map((e) => Event.fromJson(e)).toList();
    final List<Attendee> attendees = [];

    return Show(
      name: name,
      description: description,
      startDate: startDate,
      startTime: startTime,
      endDate: endDate,
      endTime: endTime,
      staff: staff,
      rings: rings,
      events: events,
      attendees: attendees,
    );
  }

  @override
  List<Object?> get props => [
        name,
        description,
        startDate,
        startTime,
        endDate,
        staff,
        rings,
        events,
        attendees,
      ];
}
