import '../repositories/notes_repository.dart';

class DeleteNote {
  final NotesRepository repository;

  DeleteNote(this.repository);

  Future<void> call(int id, bool fromDatabase) async {
    await repository.deleteNoteById(id, fromDatabase);
  }
}
