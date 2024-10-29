import 'package:blocs_app/presentation/screens/assing_new_thread/assign_new_thread_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:blocs_app/presentation/screens/screens.dart';

final _privateRoutes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/simple-cubit',
    builder: (context, state) => const CubitScreen(),
  ),
  GoRoute(
    path: '/cubit-router',
    builder: (context, state) => const RouterScreen(),
  ),
  GoRoute(
    path: '/cubit-state',
    builder: (context, state) => const MultipleCubitScreen(),
  ),
  GoRoute(
    path: '/guest-bloc',
    builder: (context, state) => const GuestsScreen(),
  ),
  GoRoute(
    path: '/pokemon-bloc',
    builder: (context, state) => const PokemonScreen(),
  ),
  GoRoute(
    path: '/blocs-with-blocs',
    builder: (context, state) => const BlocsWithBlocsScreen(),
  ),
  GoRoute(
    path: '/blocs-with-blocs',
    builder: (context, state) => const BlocsWithBlocsScreen(),
  ),
  GoRoute(
    path: '/assing-new-thread',
    builder: (context, state) => const AssignNewThreadScreen(),
  ),
]);

class RouterSimpleCubit extends Cubit<GoRouter> {
  RouterSimpleCubit() : super(_privateRoutes);

  void goBack() {
    state.pop();
  }
}
