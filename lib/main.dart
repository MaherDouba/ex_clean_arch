import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'features/notes/data/data_sources/notes_local_data_source.dart';
import 'features/notes/data/data_sources/shared_preferences_helper.dart';
import 'features/notes/presentation/pages/home_page.dart';
import 'features/notes/presentation/pages/add_notes_page.dart';
import 'features/notes/presentation/pages/edit_notes_page.dart';
import 'features/notes/domain/usecases/add_note.dart';
import 'features/notes/domain/usecases/delete_note.dart';
import 'features/notes/domain/usecases/get_notes.dart';
import 'features/notes/domain/usecases/update_note.dart';
import 'features/notes/presentation/controllers/notes_controller.dart';
import 'features/notes/data/repositories/notes_repository_impl.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  // Initialize data sources
  final notesLocalDataSource = NotesLocalDataSource();
  final sharedPreferencesHelper = SharedPreferencesHelper();

  // Initialize repository
  final notesRepository = NotesRepositoryImpl(
    localDataSource: notesLocalDataSource,
    sharedPreferencesHelper: sharedPreferencesHelper,
  );

  // Initialize use cases
  final getNotes = GetNotes(notesRepository);
  final addNote = AddNote(notesRepository);
  final updateNote = UpdateNote(notesRepository);
  final deleteNote = DeleteNote(notesRepository);

  // Initialize controller
  final notesController = NotesController(
    getNotes: getNotes,
    addNote: addNote,
    updateNote: updateNote,
    deleteNote: deleteNote,
  );

  runApp(MyApp(notesController: notesController));
}

class MyApp extends StatelessWidget {
  final NotesController notesController;

  const MyApp({Key? key, required this.notesController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      home: HomePage(notesController: notesController),
      routes: {
        "addnotes": (context) => AddNotesPage(notesController: notesController),
        "editnotes": (context) => EditNotesPage(notesController: notesController),
      },
    );
  }
}
