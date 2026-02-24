import 'package:flutter/foundation.dart';
import '../models/note.dart';
import '../services/shared_prefs_service.dart';

class NotesProvider extends ChangeNotifier {
  final StorageService _storage = StorageService();
  List<Note> _notes = [];
  String _query = '';

  List<Note> get notes => _notes;
  String get query => _query;

  List<Note> get filteredNotes {
    final list = _notes.toList();
    if (_query.isEmpty) {
      return list.reversed.toList();
    }
    final q = _query.toLowerCase();
    return list
        .where((n) => n.title.toLowerCase().contains(q))
        .toList()
        .reversed
        .toList();
  }

  Future<void> loadNotes() async {
    _notes = await _storage.loadNotes();
    notifyListeners();
  }

  Future<void> _saveAll() async {
    await _storage.saveNotes(_notes);
  }

  Future<void> addOrUpdate(Note note) async {
    final index = _notes.indexWhere((n) => n.id == note.id);
    note.updatedAt = DateTime.now();
    if (index >= 0) {
      _notes[index] = note;
    } else {
      _notes.add(note);
    }
    await _saveAll();
    notifyListeners();
  }

  Future<void> delete(Note note) async {
    _notes.removeWhere((n) => n.id == note.id);
    await _saveAll();
    notifyListeners();
  }

  void setQuery(String q) {
    _query = q;
    notifyListeners();
  }
}
