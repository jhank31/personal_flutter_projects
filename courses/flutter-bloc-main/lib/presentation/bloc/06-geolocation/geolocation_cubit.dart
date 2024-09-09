import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  final void Function((double lat, double lng) location)?
      onNewUserLocationCallback;

  GeolocationCubit({
    this.onNewUserLocationCallback,
  }) : super(const GeolocationState());

  Future<void> checkStatus() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    var permissionGranted = await Geolocator.checkPermission();
    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();
    }

    emit(state.copyWith(
      servieEnabled: serviceEnabled,
      permissionGranted: permissionGranted == LocationPermission.whileInUse ||
          permissionGranted == LocationPermission.always,
    ));
  }

  Future<void> watchUserLocation() async {
    await checkStatus();

    if (!state.permissionGranted || !state.servieEnabled) return;

    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 15,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      final newLocation = (position.latitude, position.longitude);
      emit(state.copyWith(location: newLocation));

      onNewUserLocationCallback?.call(newLocation);
    });
  }
}
