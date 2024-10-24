import 'package:flutter/material.dart';

class RecordModel {
  late UniqueKey id;
  final String content;
  final String emotionType;
  late DateTime crateAt;

  RecordModel({
    required this.content,
    required this.emotionType,
  }) {
    // -- Random id
    // TODO: Change this later "it will be generated randomly"
    id = UniqueKey();
    crateAt = DateTime.now();
  }
}
