import 'package:flutter/material.dart';

class RecordModel {
  late String id;
  late String content;
  late String emotionType;
  late DateTime crateAt;

  RecordModel({
    required this.content,
    required this.emotionType,
  }) {
    // -- Random id
    id = UniqueKey().toString();
    crateAt = DateTime.now();
  }

  //-- From json to object template
  RecordModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    emotionType = json['emotionType'];
    crateAt = DateTime.parse(json['crateAt']);
  }

  //-- To json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "content": content,
      "emotionType": emotionType,
      "crateAt": crateAt.toString(),
    };
  }
}

/**
 * Json Data Example :
 
 {
  "id": "#sss",
  "content": "this is a feeling",
  "emotionType": "happy",
  "crateAt": "2-2-24",
 }
 */
