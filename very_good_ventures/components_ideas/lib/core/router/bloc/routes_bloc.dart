import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'routes_event.dart';
part 'routes_state.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  RoutesBloc()
      : super(
          const RoutesInitialState(),
        ) {
    on<RoutesInitEvent>(_onInit);
    on<RoutesChangedEvent>(_onChangeRoutes);
    on<RoutesChangedNavBarEvent>(_onChangeNavBarRoutes);
  }

  //*[@NAVIGATION METODES]
  /// Metodo que se encarga de navegar a una nueva pantalla
  FutureOr<dynamic> navigationHelper({
    required String routeName,
    required VoidCallback onNavigate,
  }) {
    add(
      RoutesChangedEvent(
        routeName: routeName,
        onNavigate: onNavigate,
      ),
    );
  }

  //* [@HANDLRES]

  void _onInit(
    RoutesInitEvent event,
    Emitter<RoutesState> emit,
  ) {}

  void _onChangeRoutes(
    RoutesChangedEvent event,
    Emitter<RoutesState> emit,
  ) {
    emit(
      RoutesNewRoutState.from(
        state: state.copyWith(routeName: event.routeName),
      ),
    );
    event.onNavigate();
  }

  void _onChangeNavBarRoutes(
    RoutesChangedNavBarEvent event,
    Emitter<RoutesState> emit,
  ) {
    emit(
      RoutesNewRoutNavBarState.from(
        state: state.copyWith(
          currentIdNavBar: event.currentIdNavBar,
          lastIdNavBar: state.currentIdNavBar,
        ),
      ),
    );
  }
}
