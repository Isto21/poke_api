import 'package:poke_api/PokeApi/domain/entities/poke_data.dart';
import 'package:poke_api/PokeApi/infra/models/request.dart';

class PokeDataMapper {
  PokeData pokeDataToEntity(Request request) => PokeData(
      name: request.results.map((results) => results.name).toList(),
      path: request.results.map((results) => results.url).toList(),
      nextPage: request.next,
      previousPage: request.previous);
}
