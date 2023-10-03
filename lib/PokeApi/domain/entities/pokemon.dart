// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:poke_api/PokeApi/domain/entities/abilities.dart';
import 'package:poke_api/PokeApi/domain/entities/species.dart';
import 'package:poke_api/PokeApi/domain/entities/stats.dart';
import 'package:poke_api/PokeApi/domain/entities/type.dart';

class Pokemon {
  List<Abilities> abilities;
  int baseExperience;
  List<Specie> forms;
  int height;
  String locationAreaEncounters;
  String name;
  int order;
  Specie species;
  String sprites;
  List<Stats> stats;
  List<Types> types;
  int weight;
  Pokemon({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.height,
    required this.locationAreaEncounters,
    required this.name,
    required this.order,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });
}

class VersionGroupDetail {
  int levelLearnedAt;
  Specie moveLearnMethod;
  Specie versionGroup;

  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });
}
