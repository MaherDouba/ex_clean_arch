import '../entities/note.dart';
import '../repositories/notes_repository.dart';

class AddNote {
  final NotesRepository repository;

  AddNote(this.repository);

  Future<void> call(Note note, bool toDatabase) async {
    await repository.addNote(note, toDatabase);
  }
}
