import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future<String> Function(int id) _fetchPokemonName;
  PokemonBloc({required Future<String> Function(int id) fetchPokemon})
      : _fetchPokemonName = fetchPokemon,
        super(const PokemonState()) {
    on<PokemonAdded>(_fetchPokemonNameHandler);
  }

  Future<String> fetchPokemonName(int id) async {
    if (state.pokemons.containsKey(id)) {
      return state.pokemons[id]!;
    }
    try {
      final pokemonName = await _fetchPokemonName(id);
      add(PokemonAdded(id, pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Failed to fetch pokemon name');
    }
  }

  @protected
  void _fetchPokemonNameHandler(
      PokemonAdded event, Emitter<PokemonState> emit) {
    final newPokemons = Map<int, String>.from(state.pokemons);
    newPokemons[event.id] = event.name;
    emit(state.copyWith(pokemons: newPokemons));
  }
}
