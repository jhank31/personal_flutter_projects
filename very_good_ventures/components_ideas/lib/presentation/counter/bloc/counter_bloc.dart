import 'package:components_ideas/presentation/counter/custom_bloc/custom_bloc.dart';

part 'counter_events.dart'; 
/// Implementación de un Bloc para un contador
class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc() : super(0);

  @override
  void mapEventToState(CounterEvents event) {
    switch (event.runtimeType) {
      case IncrementEvent:
        emit(state + 1);
      case DecrementEvent:
        emit(state - 1);
    }
  }
}
