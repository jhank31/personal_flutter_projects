part of 'routes_bloc.dart';

sealed class RoutesEvent extends Equatable {
  const RoutesEvent();

  @override
  List<Object> get props => [];
}

final class RoutesInitEvent extends RoutesEvent {
  const RoutesInitEvent();
}

/// Evento que se dispara navegar a otra pantalla
final class RoutesChangedEvent extends RoutesEvent {
  const RoutesChangedEvent({
    required this.routeName,
    required this.onNavigate,
  });
  /// Nombre de la ruta a la que se navegará
  final String routeName;

  /// Función con la cual se navegará a la ruta
  final VoidCallback onNavigate;

  @override
  List<Object> get props => [routeName];
}

final class RoutesChangedNavBarEvent extends RoutesEvent {
  const RoutesChangedNavBarEvent({
    required this.currentIdNavBar,
  });
  final int currentIdNavBar;

  @override
  List<Object> get props => [currentIdNavBar];
}
