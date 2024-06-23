import '../../domain/entities/note.dart';
import '../../domain/repositories/notes_repository.dart';
import '../data_sources/notes_local_data_source.dart';
import '../data_sources/shared_preferences_helper.dart';
import '../models/note_model.dart';


class NotesRepositoryImpl implements NotesRepository {
  final NotesLocalDataSource localDataSource;
  final SharedPreferencesHelper sharedPreferencesHelper;
   

  NotesRepositoryImpl({
    required this.localDataSource,
    required this.sharedPreferencesHelper,
   
  });

  @override
  Future<List<Note>> getNotes(bool fromDatabase) async {
    if (fromDatabase) {
      return await localDataSource.getNotes();
    } else {
      return await sharedPreferencesHelper.getNotes();
    }
  }

  @override
  Future<void> addNote(Note note, bool toDatabase) async {
    final noteModel = NoteModel(
      id: note.id,
      title: note.title,
      note: note.note,
      color: note.color,
    );
    if (toDatabase) {
      await localDataSource.addNote(noteModel);
    } else {
      await sharedPreferencesHelper.addNote(noteModel);
    }
  }

  @override
  Future<void> updateNote(Note note, bool toDatabase) async {
    final noteModel = NoteModel(
      id: note.id,
      title: note.title,
      note: note.note,
      color: note.color,
    );
    if (toDatabase) {
      await localDataSource.updateNote(noteModel);
    } else {
      await sharedPreferencesHelper.updateNote(noteModel);
    }
  }

  @override
  Future<void> deleteNoteById(int id, bool fromDatabase) async {
    if (fromDatabase) {
      await localDataSource.deleteNoteById(id);
    } else {
      await sharedPreferencesHelper.deleteNoteById(id);
    }
  }
}

