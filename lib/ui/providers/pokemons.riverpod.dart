
import 'package:poke_api/PokeApi/domain/entities/pokemon.dart';
import 'package:poke_api/PokeApi/infra/datasources/poke_api_datasource.dart';
import 'package:poke_api/PokeApi/infra/repository/datasource_impl.dart';
import 'package:poke_api/ui/providers/page.riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemons.riverpod.g.dart';

@riverpod
Future<List<Pokemon>> pokemonsData(PokemonsDataRef ref) {
  final page = ref.watch(pageIndexProvider);
  return RepositoryImpl(datasource: PokeApiDatasource()).fetchPageData(page);
}