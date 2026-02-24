import 'dart:convert';

class Note {
  String id;
  String title;
  String content;
  DateTime updatedAt;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.updatedAt,
  });

  factory Note.create() {
    final now = DateTime.now();
    return Note(
      id: now.microsecondsSinceEpoch.toString(),
      title: '',
      content: '',
      updatedAt: now,
    );
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  static List<Note> listFromJson(String source) {
    final decoded = jsonDecode(source) as List<dynamic>;
    return decoded
        .map((e) => Note.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static String listToJson(List<Note> notes) {
    final list = notes.map((e) => e.toJson()).toList();
    return jsonEncode(list);
  }
}
