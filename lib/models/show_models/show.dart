import 'package:cloud_firestore/cloud_firestore.dart';
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
    this.id,
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
  final String? id;

  factory Show.fromJson(Map<String, dynamic> json) {
    final String name = json['name'];
    final String description = json['description'];
    final DateTime startDate = (json['startDate'] as Timestamp).toDate();

    final TimeOfDay startTime =
        (json['startTime'] as String).convertToTimeOfDay();

    final DateTime endDate = (json['endDate'] as Timestamp).toDate();
    final TimeOfDay? endTime = json.keys.contains('endTime')
        ? (json['endTime'] as String).convertToTimeOfDay()
        : null;
    final List<User> staff =
        (json['staff'] as List).map((e) => User.fromJson(e)).toList();
    final List<Ring> rings =
        (json['rings'] as List).map((e) => Ring.fromJson(e)).toList();
    final List<Event> events =
        (json['events'] as List).map((e) => Event.fromJson(e)).toList();
    final List<Attendee> attendees = [];
    final String? id = json.containsKey('id') ? json['id'] : null;

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
      id: id,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['name'] = name;
    json['description'] = description;
    json['startDate'] = startDate;
    json['startTime'] = '${startTime.hour}:${startTime.minute}';
    json['endDate'] = endDate;
    if (endTime != null) {
      json['endTime'] = '${endTime!.hour}:${endTime!.minute}';
    }
    json['staff'] = staff.map((e) => e.toJson()).toList();
    json['rings'] = rings.map((e) => e.toJson()).toList();
    json['events'] = events.map((e) => e.toJson()).toList();
    json['attendees'] = attendees.map((e) => e.toJson()).toList();
    if (id != null) {
      json['id'] = id;
    }

    return json;
  }

  @override
  String toString() {
    return name;
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

  Show copyWith({
    String? name,
    String? description,
    DateTime? startDate,
    TimeOfDay? startTime,
    DateTime? endDate,
    TimeOfDay? endTime,
    List<User>? staff,
    List<Ring>? rings,
    List<Event>? events,
    List<Attendee>? attendees,
    String? id,
  }) {
    return Show(
      name: name ?? this.name,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      startTime: startTime ?? this.startTime,
      endDate: endDate ?? this.endDate,
      endTime: endTime ?? this.endTime,
      staff: staff ?? this.staff,
      rings: rings ?? this.rings,
      events: events ?? this.events,
      attendees: attendees ?? this.attendees,
      id: id ?? this.id,
    );
  }
}

extension FirestoreParsing on String {
  TimeOfDay convertToTimeOfDay() {
    final List<String> timeSplit = split(':');
    final int hours = int.parse(timeSplit[0]);
    final int minutes = int.parse(timeSplit[1]);
    final TimeOfDay time = TimeOfDay(hour: hours, minute: minutes);
    return time;
  }
}
