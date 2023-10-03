 
 import 'package:poke_api/PokeApi/domain/entities/species.dart';
import 'package:poke_api/PokeApi/infra/models/pokemons.dart';

class SpeciesMapper {

  Specie specieToEntity (Species species)=>Specie(name: species.name, url: species.url);
 }