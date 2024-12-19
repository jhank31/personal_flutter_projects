// ignore_for_file: avoid_print

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'countdown_event.dart';
part 'countdown_state.dart';

class CountdownBloc extends Bloc<CountdownEvent, CountdownState> {
  CountdownBloc() : super(const CountdownInitial()) {
    on<StartCountdownEvent>(_onStartCountdown);
    on<UpdateCountdownEvent>(_onUpdateCountdown);
    on<FinishCountdownEvent>(_onFinishCountdown);
  }

  Duration? _remainingTime;

  void _onStartCountdown(
    StartCountdownEvent event,
    Emitter<CountdownState> emit,
  ) {
    /// validación: si ya hay un temporizador en ejecución
    /// no iniciar uno nuevo
    if (state is CountdownRunning) return;

    /// Se calcula el tiempo restante
    _remainingTime = event.targetDateTime.difference(DateTime.now());

    // Validar si el tiempo restante es negativo
    if (_remainingTime!.isNegative) {
      emit(const CountdownFinished());
      return;
    }

    /// Iniciar el temporizador que esta en el state
    emit(
      CountdownInitial.from(
        state: state.copyWith(
          remainingTime: _remainingTime,
          timer: Timer.periodic(const Duration(seconds: 1), (timer) {
            _remainingTime = _remainingTime! - const Duration(seconds: 1);
            if (_remainingTime!.inSeconds <= 0) {
              /// Si el tiempo restante es menor o igual a 0
              /// se emite el evento de finalización
              /// y se cancela el temporizador
              add(FinishCountdownEvent());
              timer.cancel();
            } else {
              /// Si el tiempo restante es mayor a 0
              /// se emite el evento de actualización
              add(UpdateCountdownEvent());
            }
          }),
        ),
      ),
    );

    /// Se emite el estado de cuenta regresiva en ejecución
    emit(
      CountdownRunning.from(
        state: state.copyWith(remainingTime: _remainingTime),
      ),
    );
  }

  void _onUpdateCountdown(
    UpdateCountdownEvent event,
    Emitter<CountdownState> emit,
  ) {
    /// Se actualiza el tiempo restante
    emit(
      CountdownRunning.from(
        state: state.copyWith(remainingTime: _remainingTime),
      ),
    );
  }

  void _onFinishCountdown(
    FinishCountdownEvent event,
    Emitter<CountdownState> emit,
  ) {
    /// Se cancela el temporizador
    state.timer!.cancel();

    /// Se emite el estado de cuenta regresiva finalizada
    emit(const CountdownFinished());
  }

  /// Se cancela el temporizador al cerrar el bloc
  @override
  Future<void> close() {
    state.timer!.cancel();
    return super.close();
  }
}
