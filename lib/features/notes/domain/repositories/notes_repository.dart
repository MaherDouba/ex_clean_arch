import '../entities/note.dart';

abstract class NotesRepository {
  Future<List<Note>> getNotes(bool fromDatabase);
  Future<void> addNote(Note note, bool toDatabase);
  Future<void> updateNote(Note note, bool toDatabase);
  Future<void> deleteNoteById(int id, bool fromDatabase);
}
