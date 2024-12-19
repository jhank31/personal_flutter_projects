part of 'countdown_bloc.dart';

abstract class CountdownEvent extends Equatable {
  const CountdownEvent();

  @override
  List<Object> get props => [];
}

class StartCountdownEvent extends CountdownEvent {
  /// recibe la fecha objetivo para el temporizador
  const StartCountdownEvent({required this.targetDateTime});
  final DateTime targetDateTime;
}

  /// Evento para actualizar el temporizador
class UpdateCountdownEvent extends CountdownEvent {}

  /// Evento para finalizar el temporizador
class FinishCountdownEvent extends CountdownEvent {}
