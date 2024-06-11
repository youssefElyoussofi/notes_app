part of 'notes_cubit_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}
final class NotesLoading extends NotesState {}
final class NotesSuccess extends NotesState {}
final class NotesFailed extends NotesState {}
