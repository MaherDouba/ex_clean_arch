import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note_model.dart';

class SharedPreferencesHelper {
  Future<List<NoteModel>> getNotes() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String? dataString = sharedPrefs.getString('dataList');
    if (dataString != null) {
      List<dynamic> decodedList = json.decode(dataString);
      return decodedList.map((json) => NoteModel.fromMap(json)).toList();
    }
    return [];
  }

  Future<void> addNote(NoteModel note) async {
    List<NoteModel> notes = await getNotes();
    notes.add(note);
    await saveNotes(notes);
  }

  Future<void> updateNote(NoteModel note) async {
    List<NoteModel> notes = await getNotes();
    int index = notes.indexWhere((n) => n.id == note.id);
    if (index != -1) {
      notes[index] = note;
      await saveNotes(notes);
    }
  }

  Future<void> deleteNoteById(int id) async {
    List<NoteModel> notes = await getNotes();
    notes.removeWhere((n) => n.id == id);
    await saveNotes(notes);
  }

  Future<void> saveNotes(List<NoteModel> notes) async {
    print(' save wiht shared prefrence');
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String dataString = json.encode(notes.map((note) => note.toMap()).toList());
    await sharedPrefs.setString('dataList', dataString);
  }
}
