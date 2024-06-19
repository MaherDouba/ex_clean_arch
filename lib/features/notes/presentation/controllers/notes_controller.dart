import '../../domain/entities/note.dart';
import '../../domain/usecases/add_note.dart';
import '../../domain/usecases/delete_note.dart';
import '../../domain/usecases/get_notes.dart';
import '../../domain/usecases/update_note.dart';

class NotesController {
  final GetNotes getNotes;
  final AddNote addNote;
  final UpdateNote updateNote;
  final DeleteNote deleteNote;

  NotesController({
    required this.getNotes,
    required this.addNote,
    required this.updateNote,
    required this.deleteNote,
  });

  List<Note> notes = [];

  Future<void> fetchNotes(bool fromDatabase) async {
    notes = await getNotes(fromDatabase);
  }

  Future<void> createNote(Note note, bool toDatabase) async {
    await addNote.call(note, toDatabase);
    await fetchNotes(toDatabase);
  }

  Future<void> editNote(Note note, bool toDatabase) async {
    await updateNote.call(note, toDatabase);
    await fetchNotes(toDatabase);
  }

  Future<void> removeNoteById(int id, bool fromDatabase) async {
    await deleteNote.call(id, fromDatabase);
    await fetchNotes(fromDatabase);
  }
}
