part of 'guest_bloc.dart';

sealed class GuestEvent extends Equatable {
  const GuestEvent();

  @override
  List<Object> get props => [];
}

final class SetAllGestEvent extends GuestEvent {}

final class SetAllInvitedGestEvent extends GuestEvent {}

final class SetAllNoInvitedGestEvent extends GuestEvent {}

final class SetCustomFilterGestEvent extends GuestEvent {
  final GuestFilter filter;

  const SetCustomFilterGestEvent(this.filter);

  @override
  List<Object> get props => [filter];
}

final class AddNewGuestEvent extends GuestEvent {
  final String name;

  const AddNewGuestEvent(this.name);

  @override
  List<Object> get props => [name];
}

final class ToggleGuestEvent extends GuestEvent {
  final String id;

  const ToggleGuestEvent(this.id);

  @override
  List<Object> get props => [id];
}
