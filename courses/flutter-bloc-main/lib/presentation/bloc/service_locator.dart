import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/bloc/blocs.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());
  getIt.registerSingleton(GuestBloc());
  getIt.registerSingleton(
      PokemonBloc(fetchPokemon: PokemonInformation.getPokemonName));
  getIt.registerSingleton(HistoricLocationBloc());
  getIt.registerSingleton(GeolocationCubit(
      onNewUserLocationCallback:
          getIt<HistoricLocationBloc>().onNewUserLocation)
    ..watchUserLocation());
}
