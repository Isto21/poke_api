import 'package:poke_api/PokeApi/domain/entities/species.dart';

class Stats {
  int baseStat;
  int effort;
  Specie stat;

  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
}
