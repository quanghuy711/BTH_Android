import 'package:shared_preferences/shared_preferences.dart';
import '../models/note.dart';

class StorageService {
  static const String _kKeyNotes = 'smart_notes_v1';

  Future<List<Note>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_kKeyNotes);
    if (jsonString == null || jsonString.isEmpty) return [];
    try {
      return Note.listFromJson(jsonString);
    } catch (e) {
      return [];
    }
  }

  Future<void> saveNotes(List<Note> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = Note.listToJson(notes);
    await prefs.setString(_kKeyNotes, jsonString);
  }
}
