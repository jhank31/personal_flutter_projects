part of 'app_life_cycle_listener_bloc.dart';

sealed class AppLifeCycleListenerEvent extends Equatable {
  const AppLifeCycleListenerEvent();
}

final class AppLifeCycleListenerOnResumeEvent
    extends AppLifeCycleListenerEvent {
  const AppLifeCycleListenerOnResumeEvent();

  @override
  List<Object> get props => [];
}

final class AppLifeCycleListenerOnStartEvent extends AppLifeCycleListenerEvent {
  const AppLifeCycleListenerOnStartEvent();

  @override
  List<Object> get props => [];
}

final class AppLifeCycleListenerOnTempResumeEvent
    extends AppLifeCycleListenerEvent {
  const AppLifeCycleListenerOnTempResumeEvent();

  @override
  List<Object> get props => [];
}
