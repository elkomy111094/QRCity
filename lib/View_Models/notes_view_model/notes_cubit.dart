import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qr_city/Models/note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);

  TextEditingController noteNameController = TextEditingController(text: "");
  TextEditingController noteCountController = TextEditingController(text: "0");
  TextEditingController notePriceController = TextEditingController(text: "0");

  GlobalKey<FormState> addingNewFormKey = GlobalKey<FormState>();

  int total = 0;

  List<Note> newNotesList = [];
  List<Note> unCompletedNotesList = [];
  List<Note> completedNotesList = [];

  CaluateNewNoteTotalPrice({required int price, required int count}) {
    total = price * count;
    emit(TotalPriceCalculated());
  }

  clearNoteControllers() {
    notePriceController.clear();
    noteNameController.clear();
    noteCountController.clear();
    total = 0;
    emit(FieldsCleared());
  }

  addNoteToListOfAddingNewNotes() {
    newNotesList.add(Note(
        count: int.parse(noteCountController.text),
        name: noteNameController.text,
        price: int.parse(notePriceController.text),
        total: total));
    clearNoteControllers();
    emit(NewNoteAddedToList());
  }

  saveMyNewNotes() {
    newNotesList.add(Note(
        count: int.parse(noteCountController.text),
        name: noteNameController.text,
        price: int.parse(notePriceController.text),
        total: total));
    unCompletedNotesList.addAll(newNotesList);
    notePriceController.clear();
    noteNameController.clear();
    noteCountController.clear();
    total = 0;
    newNotesList.clear();
    emit(NewNotesAddedToUnCompletedList());
  }

  addNoteToCompletedList(int index) {
    completedNotesList.add(unCompletedNotesList[index]);
    unCompletedNotesList.removeAt(index);
    emit(newNoteAddedToCompletedList());
  }

  removeNoteFromUnCompleteList(int index) {
    unCompletedNotesList.removeAt(index);
    emit(NoteRemovedFromUnCompletedList());
  }

  backNoteFromCompletedToUnCompletedList(index) {
    unCompletedNotesList.add(completedNotesList[index]);
    completedNotesList.removeAt(index);
    emit(NoteBackToUnCompletedList());
  }
}
