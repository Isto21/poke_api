import 'package:poke_api/PokeApi/domain/entities/stats.dart';
import 'package:poke_api/PokeApi/infra/mappers/species_mapper.dart';
import 'package:poke_api/PokeApi/infra/models/pokemons.dart';

class StatsMapper {
  Stats statsToEntity(Stat stat) =>
      Stats(baseStat: stat.baseStat, effort: stat.effort, stat: SpeciesMapper().specieToEntity(stat.stat));
}
