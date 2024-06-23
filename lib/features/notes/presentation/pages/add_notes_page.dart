import 'package:flutter/material.dart';
import '../controllers/notes_controller.dart';
import '../../domain/entities/note.dart';

class AddNotesPage extends StatelessWidget {
  final NotesController notesController;

  AddNotesPage({Key? key, required this.notesController}) : super(key: key);
  
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  
  Future<void> onAddNote() async {
    final newNote = Note(
      id: DateTime.now().millisecondsSinceEpoch, 
      title: titleController.text,
      note: noteController.text,
      color: colorController.text,
    );
    
    await notesController.createNote(newNote, true);
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: noteController,
              decoration: InputDecoration(labelText: 'Note'),
            ),
            TextField(
              controller: colorController,
              decoration: InputDecoration(labelText: 'Color'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await onAddNote();
                Navigator.of(context).pop();
              },
              child: Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
