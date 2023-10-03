import 'package:dio/dio.dart';
import 'package:poke_api/PokeApi/domain/datasource/datasource.dart';
import 'package:poke_api/PokeApi/domain/entities/pokemon.dart';
import 'package:poke_api/PokeApi/infra/mappers/pokemon_mapper.dart';
import 'package:poke_api/PokeApi/infra/models/pokemons.dart';
import 'package:poke_api/PokeApi/infra/models/request.dart';

class PokeApiDatasource extends Datasource {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/pokemon/'));

  @override
  Future<List<Pokemon>> fetchPageData(int page) async {
    // print(page*20);
    final response = await dio.get('', queryParameters: {'offset': page * 20});
    final data = Request.fromJson(response.data);
    final List<String> names =
        data.results.map((results) => results.name).toList();
    final List<Response> pokemonsData =
        await names.map((names) async => await dio.get(names)).wait;
    final List<Pokemons> responseData =
        pokemonsData.map((e) => Pokemons.fromJson(e.data)).toList();
    final List<Pokemon> pokemons =
        responseData.map((e) => PokemonMapper().pokemonToEntity(e)).toList();
        // print(pokemons[1]);
    return pokemons;
  }
}
