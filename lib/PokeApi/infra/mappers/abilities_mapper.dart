import 'package:poke_api/PokeApi/domain/entities/abilities.dart';
import 'package:poke_api/PokeApi/infra/mappers/species_mapper.dart';
import 'package:poke_api/PokeApi/infra/models/pokemons.dart';

class AbilitiesMapper {
  Abilities abilitiesToEntity(Ability hability) =>
      Abilities(ability: SpeciesMapper().specieToEntity(hability.ability), isHidden: hability.isHidden, slot: hability.slot);
}
