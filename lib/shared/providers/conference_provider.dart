import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConferenceTagStateNotifier
    extends StateNotifier<List<ConferenceTagData>> {
  ConferenceTagStateNotifier() : super([]);
}

class ConferenceTagData {
  final String id;
  final IconData icon;
  final String item;
  final bool isSelected;

  ConferenceTagData({
    required this.id,
    required this.icon,
    required this.item,
    this.isSelected = false, // Default value for isSelected
  });
}

class SlotsData {
  final String startTime;
  final String endTime;
  final bool isSelected;

  SlotsData(
      {required this.startTime,
      required this.endTime,
      required this.isSelected});
}

// Provider for the ConferenceTagStateNotifier

final List<Map<String, dynamic>> conferenceRooms = [
  {
    'roomId': '1A',
    'roomName': 'Conference Room - 1',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': true, 'Wifi': true, 'Projector': true},
    'slots': [
      SlotsData(startTime: '09:00', endTime: '10:00', isSelected: false),
      SlotsData(startTime: '10:30', endTime: '11:30', isSelected: true),
      SlotsData(startTime: '12:00', endTime: '13:00', isSelected: false),
      SlotsData(startTime: '14:00', endTime: '15:00', isSelected: true),
      SlotsData(startTime: '16:00', endTime: '17:00', isSelected: false),
    ]
  },
  {
    'roomId': '2B',
    'roomName': 'Conference Room - 2',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': true, 'Wifi': true, 'Projector': false},
    'slots': [
      SlotsData(startTime: '09:30', endTime: '10:30', isSelected: true),
      SlotsData(startTime: '11:30', endTime: '12:30', isSelected: false),
      SlotsData(startTime: '13:30', endTime: '14:30', isSelected: false),
      SlotsData(startTime: '15:30', endTime: '16:30', isSelected: false),
      SlotsData(startTime: '17:30', endTime: '18:30', isSelected: true),
    ]
  },
  {
    'roomId': '3C',
    'roomName': 'Conference Room - 3',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': true, 'Wifi': false, 'Projector': true},
    'slots': [
      SlotsData(startTime: '09:00', endTime: '10:00', isSelected: false),
      SlotsData(startTime: '10:30', endTime: '11:30', isSelected: true),
      SlotsData(startTime: '12:30', endTime: '13:30', isSelected: false),
      SlotsData(startTime: '14:30', endTime: '15:30', isSelected: false),
      SlotsData(startTime: '16:30', endTime: '17:30', isSelected: true),
    ]
  },
  {
    'roomId': '4D',
    'roomName': 'Conference Room - 4',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': true, 'Wifi': true, 'Projector': true},
    'slots': [
      SlotsData(startTime: '09:30', endTime: '10:30', isSelected: true),
      SlotsData(startTime: '11:30', endTime: '12:30', isSelected: false),
      SlotsData(startTime: '13:30', endTime: '14:30', isSelected: true),
      SlotsData(startTime: '15:30', endTime: '16:30', isSelected: false),
      SlotsData(startTime: '17:30', endTime: '18:30', isSelected: false),
    ]
  },
  {
    'roomId': '5E',
    'roomName': 'Conference Room - 5',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': true, 'Wifi': true, 'Projector': true},
    'slots': [
      SlotsData(startTime: '10:00', endTime: '11:00', isSelected: false),
      SlotsData(startTime: '12:00', endTime: '13:00', isSelected: true),
      SlotsData(startTime: '14:00', endTime: '15:00', isSelected: false),
      SlotsData(startTime: '16:00', endTime: '17:00', isSelected: true),
      SlotsData(startTime: '17:30', endTime: '18:30', isSelected: true),
    ]
  },
  {
    'roomId': '6F',
    'roomName': 'Conference Room - 6',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': true, 'Wifi': true, 'Projector': false},
    'slots': [
      SlotsData(startTime: '09:00', endTime: '10:00', isSelected: false),
      SlotsData(startTime: '10:30', endTime: '11:30', isSelected: true),
      SlotsData(startTime: '12:30', endTime: '13:30', isSelected: false),
      SlotsData(startTime: '14:30', endTime: '15:30', isSelected: false),
      SlotsData(startTime: '16:30', endTime: '17:30', isSelected: true),
    ]
  },
  {
    'roomId': '7G',
    'roomName': 'Conference Room - 7',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': false, 'Wifi': true, 'Projector': true},
    'slots': [
      SlotsData(startTime: '09:00', endTime: '10:00', isSelected: false),
      SlotsData(startTime: '11:00', endTime: '12:00', isSelected: true),
      SlotsData(startTime: '13:00', endTime: '14:00', isSelected: false),
      SlotsData(startTime: '15:00', endTime: '16:00', isSelected: true),
      SlotsData(startTime: '17:00', endTime: '18:00', isSelected: false),
    ]
  },
  {
    'roomId': '8H',
    'roomName': 'Conference Room - 8',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': true, 'Wifi': true, 'Projector': true},
    'slots': [
      SlotsData(startTime: '09:30', endTime: '10:30', isSelected: true),
      SlotsData(startTime: '11:30', endTime: '12:30', isSelected: false),
      SlotsData(startTime: '13:30', endTime: '14:30', isSelected: false),
      SlotsData(startTime: '15:30', endTime: '16:30', isSelected: true),
      SlotsData(startTime: '17:30', endTime: '18:30', isSelected: false),
    ]
  },
  {
    'roomId': '9I',
    'roomName': 'Conference Room - 9',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': false, 'Wifi': false, 'Projector': true},
    'slots': [
      SlotsData(startTime: '10:00', endTime: '11:00', isSelected: false),
      SlotsData(startTime: '12:00', endTime: '13:00', isSelected: true),
      SlotsData(startTime: '14:00', endTime: '15:00', isSelected: true),
      SlotsData(startTime: '16:00', endTime: '17:00', isSelected: false),
      SlotsData(startTime: '17:30', endTime: '18:30', isSelected: false),
    ]
  },
  {
    'roomId': '10J',
    'roomName': 'Conference Room - 10',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': true, 'Wifi': true, 'Projector': true},
    'slots': [
      SlotsData(startTime: '09:00', endTime: '10:00', isSelected: false),
      SlotsData(startTime: '10:30', endTime: '11:30', isSelected: true),
      SlotsData(startTime: '12:30', endTime: '13:30', isSelected: false),
      SlotsData(startTime: '14:30', endTime: '15:30', isSelected: false),
      SlotsData(startTime: '16:30', endTime: '17:30', isSelected: false),
    ]
  },
];

final List<Map<String, dynamic>> tatkalRooms = [
  {
    'roomId': '8F',
    'roomName': 'Conference Room - 1',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': false, 'Wifi': true, 'Projector': true},
  },
  {
    'roomId': '2A',
    'roomName': 'Conference Room - 2',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': true, 'Wifi': true, 'Projector': true},
  },
  {
    'roomId': '3C',
    'roomName': 'Conference Room - 3',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': true, 'Wifi': true, 'Projector': false},
  },
  {
    'roomId': '1D',
    'roomName': 'Conference Room - 4',
    'seats': '12',
    'amenities': {'Phone': true, 'TV': true, 'Wifi': true, 'Projector': true},
  },
  {
    'roomId': '5E',
    'roomName': 'Conference Room - 5',
    'seats': '12',
    'amenities': {'Phone': false, 'TV': false, 'Wifi': true, 'Projector': true},
  },
];

final List<Map<String, dynamic>> myBookingRooms = [
  {
    'meetingId': 'M101',
    'meetingName': 'Team Sync-up',
    'roomId': '1A',
    'roomName': 'Conference Room - Alpha',
    'date': DateTime(2025, 1, 10),
    'seats': '10',
    'startTime': '09:00',
    'endTime': '11:00',
    'amenities': {'Phone': true, 'TV': true, 'Wifi': true, 'Projector': false},
    'slots': [
      SlotsData(startTime: '09:00', endTime: '10:30', isSelected: true),
      SlotsData(startTime: '11:00', endTime: '12:00', isSelected: false),
    ],
  },
  {
    'meetingId': 'M102',
    'meetingName': 'Client Presentation',
    'roomId': '2B',
    'roomName': 'Conference Room - Beta',
    'date': DateTime(2025, 1, 11),
    'seats': '15',
    'startTime': '11:00',
    'endTime': '12:30',
    'amenities': {'Phone': true, 'TV': false, 'Wifi': true, 'Projector': true},
    'slots': [
      SlotsData(startTime: '10:00', endTime: '11:00', isSelected: false),
      SlotsData(startTime: '11:00', endTime: '12:30', isSelected: true),
    ],
  },
  {
    'meetingId': 'M103',
    'meetingName': 'Project Kickoff',
    'roomId': '3C',
    'roomName': 'Conference Room - Gamma',
    'date': DateTime(2025, 1, 12),
    'seats': '20',
    'startTime': '14:00',
    'endTime': '15:30',
    'amenities': {'Phone': true, 'TV': true, 'Wifi': false, 'Projector': true},
    'slots': [
      SlotsData(startTime: '14:00', endTime: '15:30', isSelected: true),
      SlotsData(startTime: '16:00', endTime: '17:00', isSelected: false),
    ],
  },
];
