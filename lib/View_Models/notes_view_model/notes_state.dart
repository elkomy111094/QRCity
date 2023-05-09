part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NewNoteAddedToList extends NotesState {}

class TotalPriceCalculated extends NotesState {}

class FieldsCleared extends NotesState {}

class NewNotesAddedToUnCompletedList extends NotesState {}

class newNoteAddedToCompletedList extends NotesState {}

class NoteRemovedFromUnCompletedList extends NotesState {}
class NoteBackToUnCompletedList extends NotesState {}
