part of 'jokes_cubit.dart';

@immutable
abstract class JokesState {}

class JokesInitial extends JokesState {}
class JokesLoading extends JokesState {}
class JokesLoaded extends JokesState{
  final UIJokeList jokes;
  JokesLoaded(this.jokes);
}
class JokesException extends JokesState {
  final Exception exception;
  JokesException(this.exception);
}
