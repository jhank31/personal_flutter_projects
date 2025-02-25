part of 'routes_bloc.dart';

class RoutesState extends Equatable {
  const RoutesState({
    this.routeName = '',
    this.currentIdNavBar = 0,
    this.lastIdNavBar = 0,
  });

  /// Constructor con nombre from para poder crear una instancia de este estado
  RoutesState.from(RoutesState state)
      : routeName = state.routeName,
        lastIdNavBar = state.lastIdNavBar,
        currentIdNavBar = state.currentIdNavBar;

  /// EL nombre de las pagina a la que se navegara
  final String routeName;

  /// El id de la ultima pagina del navbar antes de la actual
  final int? lastIdNavBar;

  /// El id de la pagina que se acaba de tapear
  final int currentIdNavBar;

  /// Creamos una copia del estado actual
  RoutesState copyWith({
    String? routeName,
    int? lastIdNavBar,
    int? currentIdNavBar,
  }) {
    return RoutesState(
      routeName: routeName ?? this.routeName,
      lastIdNavBar: lastIdNavBar ?? this.lastIdNavBar,
      currentIdNavBar: currentIdNavBar ?? this.currentIdNavBar,
    );
  }

  @override
  List<Object> get props => [routeName, lastIdNavBar ?? 0, currentIdNavBar];
}

final class RoutesInitialState extends RoutesState {
  const RoutesInitialState();

  /// creamos un contructor con nomrbe from para poder crear una instancia
  /// de este estado a partir de otro estado con las propiedades de la clase
  /// padre
  RoutesInitialState.from({
    required RoutesState state,
  }) : super.from(
          state,
        );
}

final class RoutesLoadingState extends RoutesState {}

final class RoutesNewRoutState extends RoutesState {
  const RoutesNewRoutState();

  RoutesNewRoutState.from({
    required RoutesState state,
  }) : super.from(
          state,
        );
}

final class RoutesNewRoutNavBarState extends RoutesState {
  const RoutesNewRoutNavBarState();

  RoutesNewRoutNavBarState.from({
    required RoutesState state,
  }) : super.from(
          state,
        );
}
