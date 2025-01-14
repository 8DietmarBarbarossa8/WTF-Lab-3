import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatRepository {
  List<Chat> chats = [
    Chat(
      id: 0,
      name: 'All',
      icon: Icons.all_inclusive_outlined,
      messages: QueueList.from([
        Message(
          id: 1,
          dateTime: DateTime.parse('2022-12-19 12:30:00'),
          text: 'Hello'
        ),
        Message(
          id: 2,
          dateTime: DateTime.parse('2022-12-20 13:30:00'),
          text: 'Some long message'
        ),
        Message(
          id: 3,
          dateTime: DateTime.parse('2022-12-21 17:15:00'),
          text: 'Another message',
          isFavorite: true
        ),
        Message(
          id: 4,
          dateTime: DateTime.parse('2022-12-21 17:16:24'),
          text: 'message with chips'
        ),
      ])
    ),
    Chat(
      id: 1,
      name: 'Sport',
      icon: Icons.sports_volleyball_rounded,
      messages: QueueList.from([
        Message(id: 1, text: 'Some Text'),
        Message(id: 2, text: 'Some Text'),
        Message(id: 3, text: 'Some Text'),
      ])
    ),
    Chat(
      id: 2,
      name: 'University',
      icon: Icons.science_outlined,
      messages: QueueList.from([
        Message(id: 1, text: 'Some Text'),
        Message(id: 2, text: 'Some Text'),
        Message(id: 3, text: 'Some Text'),
      ])
    ),
    Chat(
      id: 3,
      name: 'Other',
      icon: Icons.stadium_rounded,
      messages: QueueList.from([
        Message(id: 1, text: 'Some Text'),
        Message(id: 2, text: 'Some Text'),
        Message(id: 3, text: 'Some Text'),
      ])
    ),
  ];
}

class Chat {
  final int id;
  final String name;
  final IconData icon;
  final QueueList<Message> messages;

  Chat({
    required this.id,
    required this.name,
    required this.icon,
    required this.messages,
  });

  Message get lastMessage => messages.first;
}

class Message {
  final int id;
  final DateTime dateTime;
  final String text;
  final List<String> images;
  final List<String> tags;
  final bool isFavorite;

  Message({
    int? id,
    DateTime? dateTime,
    this.text = '',
    this.images = const [],
    this.tags = const [],
    this.isFavorite = false,
  }) : id = id ?? Random().nextInt(1000),
       dateTime = dateTime ?? DateTime.now();

  String get time => DateFormat.jm().format(dateTime);
  bool get hasImages => images.isNotEmpty;
  bool get hasSingleImage => images.length == 1;

  Message copyWith({
    int? id,
    DateTime? dateTime,
    String? text,
    List<String>? images,
    List<String>? tags,
    bool? isFavorite,
  }) {
    return Message(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      text: text ?? this.text,
      images: images ?? this.images,
      tags: tags ?? this.tags,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
