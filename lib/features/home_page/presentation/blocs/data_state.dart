part of 'data_bloc.dart';

@immutable
sealed class DataState {}

final class InitialState extends DataState {}

final class DataLoading extends DataState {}

final class DataLoaded extends DataState {
  final PeopleData data;
  DataLoaded({required this.data});
}

class Successful extends DataState {
  final String message;
  Successful({this.message = "Success"});
}

final class FailureState extends DataState {
  final String message;
  FailureState(this.message);
}
