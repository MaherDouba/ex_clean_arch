import '../entities/note.dart';
import '../repositories/notes_repository.dart';

class UpdateNote {
  final NotesRepository repository;

  UpdateNote(this.repository);

  Future<void> call(Note note, bool toDatabase) async {
    await repository.updateNote(note, toDatabase);
  }
}
