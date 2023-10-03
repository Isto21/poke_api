import 'package:poke_api/PokeApi/domain/entities/species.dart';

class Abilities {
  Specie ability;
  bool isHidden;
  int slot;

  Abilities({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });
}
