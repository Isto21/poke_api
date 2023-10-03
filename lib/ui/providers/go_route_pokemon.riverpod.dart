// dart run build_runner watch

import 'package:poke_api/PokeApi/domain/entities/pokemon.dart';
import 'package:poke_api/PokeApi/domain/entities/species.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_route_pokemon.riverpod.g.dart';

@riverpod
class goRoutePokemons extends _$goRoutePokemons {
  @override
  Pokemon build() {
    return Pokemon(
      abilities: [],
      baseExperience: 0,
      forms: [],
      height: 0,
      locationAreaEncounters: '',
      name: '',
      order: 0,
      species: Specie(name: '', url: ''),
      sprites: '',
      stats: [],
      types: [],
      weight: 0);
  }
}
