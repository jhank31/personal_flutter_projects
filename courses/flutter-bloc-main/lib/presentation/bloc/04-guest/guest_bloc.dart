import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:blocs_app/domain/entities/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

part 'guest_event.dart';
part 'guest_state.dart';

const uuid = Uuid();

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestBloc()
      : super(GuestState(guests: [
          Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null,
          ),
          Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: DateTime.now(),
          ),
          Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: DateTime.now(),
          ),
          Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null,
          ),
          Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: DateTime.now(),
          ),
          Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null,
          ),
          Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null,
          ),
        ])) {
    on<SetCustomFilterGestEvent>((event, emit) {
      emit(state.copyWith(
        currentFilter: event.filter,
      ));
    });
    on<AddNewGuestEvent>(addGuesthandle);
    on<ToggleGuestEvent>(changeToggleHandle);

    //! esta es una manera de hacer cambiar el evento
    // on<SetAllNoInvitedGestEvent>((event, emit) {
    //   emit(state.copyWith(
    //     currentFilter: GuestFilter.noInvited,
    //   ));
    // });

    // on<SetAllGestEvent>((event, emit) {
    //   emit(state.copyWith(
    //     currentFilter: GuestFilter.all,
    //   ));
    // });
  }

  void changeFilter(GuestFilter newFilter) {
    add(SetCustomFilterGestEvent(newFilter));
  }

  void createNewGuest(String name) {
    add(AddNewGuestEvent(name));
  }

  void updateToggle(String id) {
    add(ToggleGuestEvent(id));
  }

  //? una manera mas limpia de escribir la logica de los eventos es de esta manera y se le pasa
  //? la funcion al evento como una referencia
  @protected
  void addGuesthandle(AddNewGuestEvent event, Emitter<GuestState> emit) {
    emit(state.copyWith(
      guests: [
        ...state.guests,
        Todo(
          id: uuid.v4(),
          description: event.name,
          completedAt: null,
        )
      ],
      currentFilter: GuestFilter.all,
    ));
  }

  @protected
  void changeToggleHandle(ToggleGuestEvent event, Emitter<GuestState> emit) {
    emit(state.copyWith(
      guests: state.guests.map((e) {
        if (e.id == event.id) {
          return e.copyWith(
            completedAt: e.completedAt == null ? DateTime.now() : null,
          );
        }
        return e;
      }).toList(),
    ));
  }
}
