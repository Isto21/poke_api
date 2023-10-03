import 'package:poke_api/PokeApi/domain/entities/poke_data.dart';
import 'package:poke_api/PokeApi/domain/entities/pokemon.dart';

abstract class Datasource {
  Future<List<Pokemon>> fetchPageData(int page);

}
