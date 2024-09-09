// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'geolocation_cubit.dart';

class GeolocationState extends Equatable {
  final (double lat, double lng) location;
  final bool servieEnabled;
  final bool permissionGranted;

  const GeolocationState({
    this.location = const (0.0, 0.0),
    this.servieEnabled = false,
    this.permissionGranted = false,
  });

  @override
  List<Object> get props => [
        location,
        servieEnabled,
        permissionGranted,
      ];

  GeolocationState copyWith({
    (double lat, double lng)? location,
    bool? servieEnabled,
    bool? permissionGranted,
  }) {
    return GeolocationState(
      location: location ?? this.location,
      servieEnabled: servieEnabled ?? this.servieEnabled,
      permissionGranted: permissionGranted ?? this.permissionGranted,
    );
  }
}
