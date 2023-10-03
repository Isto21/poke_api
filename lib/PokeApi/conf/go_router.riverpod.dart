import 'package:go_router/go_router.dart';
import 'package:poke_api/ui/providers/go_route_pokemon.riverpod.dart';
import 'package:poke_api/ui/screens/home_screen.dart';
import 'package:poke_api/ui/screens/pokemon_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router.riverpod.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
 final pokemon= ref.watch(goRoutePokemonsProvider);
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/pokemonScreen',
      builder: (context, state) => PokemonScreen(pokemon: pokemon,),
    ),
  ]);
}
