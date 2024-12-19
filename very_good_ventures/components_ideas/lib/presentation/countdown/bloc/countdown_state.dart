part of 'countdown_bloc.dart';

class CountdownState extends Equatable {
  /// Constructor de la clase
  const CountdownState({
    this.remainingTime = Duration.zero,
    this.timer,
  });

  /// creamos un constructor copia que recibe un estado
  /// y copia los valores de ese estado
  /// para asignarlos a la nueva instancia
  CountdownState.from(CountdownState state)
      : remainingTime = state.remainingTime,
        timer = state.timer;

  /// tiempo restante
  final Duration remainingTime;

  /// temporizador
  final Timer? timer;

  @override
  List<Object> get props => [
        remainingTime,
        timer ?? Duration.zero,
      ];

  CountdownState copyWith({
    Duration? remainingTime,
    Timer? timer,
  }) {
    return CountdownState(
      remainingTime: remainingTime ?? this.remainingTime,
      timer: timer ?? this.timer,
    );
  }
}

class CountdownInitial extends CountdownState {
  const CountdownInitial();

  /// Constructor que recibe un estado
  /// y copia los valores de ese estado
  /// para asignarlos a la nueva instancia
  CountdownInitial.from({required CountdownState state}) : super.from(state);
}

class CountdownRunning extends CountdownState {
  const CountdownRunning();

  CountdownRunning.from({required CountdownState state}) : super.from(state);
}

class CountdownFinished extends CountdownState {
  const CountdownFinished();

  CountdownFinished.from(super.state) : super.from();
}
