// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:poke_api/PokeApi/domain/datasource/datasource.dart';
import 'package:poke_api/PokeApi/domain/entities/pokemon.dart';
import 'package:poke_api/PokeApi/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  
  Datasource datasource;
  RepositoryImpl({
    required this.datasource,
  });
  
  @override
  Future<List<Pokemon>> fetchPageData(int page) {
   return datasource.fetchPageData(page);
  }

}
