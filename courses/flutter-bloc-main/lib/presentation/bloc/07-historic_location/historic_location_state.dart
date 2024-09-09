// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'historic_location_bloc.dart';

class HistoricLocationState extends Equatable {
  final List<(double lat, double lng)> locations;
  const HistoricLocationState({
    this.locations = const [],
  });

  int get howManyLocation => locations.length;

  @override
  List<Object> get props => [locations];

  HistoricLocationState copyWith({
    List<(double lat, double lng)>? locations,
  }) {
    return HistoricLocationState(
      locations: locations ?? this.locations,
    );
  }
}
