import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_life_cycle_listener_event.dart';
part 'app_life_cycle_listener_state.dart';

class AppLifeCycleListenerBloc
    extends Bloc<AppLifeCycleListenerEvent, AppLifeCycleListenerState> {
  AppLifeCycleListenerBloc() : super(AppLifeCycleListenerInitial()) {
    on<AppLifeCycleListenerOnResumeEvent>(_onResume);
    on<AppLifeCycleListenerOnStartEvent>(_onStart);
    on<AppLifeCycleListenerOnTempResumeEvent>(_onTempResume);
  }

  void _onResume(AppLifeCycleListenerOnResumeEvent event,
      Emitter<AppLifeCycleListenerState> emit,) {
  }
  void _onStart(AppLifeCycleListenerOnStartEvent event,
      Emitter<AppLifeCycleListenerState> emit,) {
  }
  void _onTempResume(AppLifeCycleListenerOnTempResumeEvent event,
      Emitter<AppLifeCycleListenerState> emit,) {
  }
}
