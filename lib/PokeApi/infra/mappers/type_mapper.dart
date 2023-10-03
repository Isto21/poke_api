import 'package:poke_api/PokeApi/domain/entities/type.dart';
import 'package:poke_api/PokeApi/infra/mappers/species_mapper.dart';
import 'package:poke_api/PokeApi/infra/models/pokemons.dart';

class TypeMapper {
  Types typeToEntity (Type typePoke)=> Types(slot: typePoke.slot, type: SpeciesMapper().specieToEntity(typePoke.type));
}