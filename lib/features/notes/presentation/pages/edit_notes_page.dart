import 'package:flutter/material.dart';
import '../controllers/notes_controller.dart';
import '../../domain/entities/note.dart';

class EditNotesPage extends StatefulWidget {
  final NotesController notesController;

  EditNotesPage({Key? key, required this.notesController}) : super(key: key);

  @override
  _EditNotesPageState createState() => _EditNotesPageState();
}

class _EditNotesPageState extends State<EditNotesPage> {
  final _formKey = GlobalKey<FormState>();
  late Note note;
  late TextEditingController titleController;
  late TextEditingController noteController;
  late TextEditingController colorController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    note = args['note'];
    titleController = TextEditingController(text: note.title);
    noteController = TextEditingController(text: note.note);
    colorController = TextEditingController(text: note.color);
  }

  Future<void> onUpdateNote() async {
    if (_formKey.currentState!.validate()) {
      final updatedNote = Note(
        id: note.id,
        title: titleController.text,
        note: noteController.text,
        color: colorController.text,
      );
      await widget.notesController.editNote(updatedNote, true);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Title cannot be empty' : null,
              ),
              TextFormField(
                controller: noteController,
                decoration: InputDecoration(labelText: 'Note'),
                validator: (value) => value!.isEmpty ? 'Note cannot be empty' : null,
              ),
              TextFormField(
                controller: colorController,
                decoration: InputDecoration(labelText: 'Color'),
                validator: (value) => value!.isEmpty ? 'Color cannot be empty' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: onUpdateNote,
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
