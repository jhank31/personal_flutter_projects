part of 'app_life_cycle_listener_bloc.dart';

sealed class AppLifeCycleListenerState extends Equatable {
  const AppLifeCycleListenerState();
  
  @override
  List<Object> get props => [];
}

final class AppLifeCycleListenerInitial extends AppLifeCycleListenerState {}
