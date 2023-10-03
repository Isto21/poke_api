import 'package:poke_api/PokeApi/domain/entities/pokemon.dart';
import 'package:poke_api/PokeApi/infra/mappers/abilities_mapper.dart';
import 'package:poke_api/PokeApi/infra/mappers/species_mapper.dart';
import 'package:poke_api/PokeApi/infra/mappers/stats_mapper.dart';
import 'package:poke_api/PokeApi/infra/mappers/type_mapper.dart';
import 'package:poke_api/PokeApi/infra/models/pokemons.dart';

class PokemonMapper {
  Pokemon pokemonToEntity(Pokemons pokemons) => Pokemon(
      abilities: pokemons.abilities
          .map((ability) => AbilitiesMapper().abilitiesToEntity(ability))
          .toList(),
      baseExperience: pokemons.baseExperience,
      forms:
          pokemons.forms.map((e) => SpeciesMapper().specieToEntity(e)).toList(),
      height: pokemons.height,
      locationAreaEncounters: pokemons.locationAreaEncounters,
      name: pokemons.name,
      order: pokemons.order,
      
      species: SpeciesMapper().specieToEntity(pokemons.species),
      sprites: pokemons.sprites.versions?.generationIv.platinum.frontDefault ?? pokemons.sprites.frontDefault,
      stats: pokemons.stats.map((e) => StatsMapper().statsToEntity(e)).toList(),
      types: pokemons.types.map((e) => TypeMapper().typeToEntity(e)).toList(),
      weight: pokemons.weight);
}
