import 'package:poke_api/PokeApi/domain/entities/pokemon.dart';

abstract class Repository {
  Future<List<Pokemon>> fetchPageData(int page);

}
