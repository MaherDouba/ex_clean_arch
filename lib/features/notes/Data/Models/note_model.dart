import '../../domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel({
    required int id,
    required String title,
    required String note,
    required String color,
  }) : super(
          id: id,
          title: title,
          note: note,
          color: color,
        );

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      note: map['note'],
      color: map['color'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'color': color,
    };
  }
}
