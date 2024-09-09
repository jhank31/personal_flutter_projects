// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'guest_bloc.dart';

enum GuestFilter {
  all,
  invited,
  noInvited,
}

class GuestState extends Equatable {
  final GuestFilter currentFilter;
  final List<Todo> guests;
  const GuestState({
    this.currentFilter = GuestFilter.all,
    this.guests = const [],
  });

  int get totalGuest => filteredGuest.length;

  List<Todo> get filteredGuest {
    switch (currentFilter) {
      case GuestFilter.all:
        return guests;
      case GuestFilter.invited:
        return guests.where((element) => element.done).toList();
      case GuestFilter.noInvited:
        return guests.where((element) => !element.done).toList();
    }
  }

  GuestState copyWith({
    GuestFilter? currentFilter,
    List<Todo>? guests,
  }) =>
      GuestState(
        currentFilter: currentFilter ?? this.currentFilter,
        guests: guests ?? this.guests,
      );

  @override
  List<Object> get props => [currentFilter, guests];
}
