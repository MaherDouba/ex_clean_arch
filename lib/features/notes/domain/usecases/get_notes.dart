import '../entities/note.dart';
import '../repositories/notes_repository.dart';

class GetNotes {
  final NotesRepository repository;

  GetNotes(this.repository);

  Future<List<Note>> call(bool fromDatabase) async {
    return await repository.getNotes(fromDatabase);
  }
}
