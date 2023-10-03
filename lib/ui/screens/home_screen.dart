import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_api/ui/providers/go_route_pokemon.riverpod.dart';
import 'package:poke_api/ui/providers/page.riverpod.dart';
import 'package:poke_api/ui/providers/pokemons.riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemons = ref.watch(pokemonsDataProvider);
    final page = ref.watch(pageIndexProvider);
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => ref.read(pageIndexProvider.notifier).nextPage(),
            child: const Icon(Icons.arrow_forward_ios_sharp),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            onPressed: () =>
            (page==0)? null
                :ref.read(pageIndexProvider.notifier).previousPage(),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ],
      ),
      appBar: AppBar(title: const Text('Pokedex'), centerTitle: true),
      body: pokemons.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text('${page * 20}/1292'),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                    runSpacing: 5,
                    spacing: 2,
                    children: data
                        .map((pokemon) => InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                ref
                                    .read(goRoutePokemonsProvider.notifier)
                                    .state = pokemon;
                                context.push('/pokemonScreen');
                              },
                              child: Card(
                                child: Stack(children: [
                                  Image.network(pokemon.sprites),
                                  Positioned(
                                      bottom: 3,
                                      left: 0,
                                      right: 0,
                                      child: Text(pokemon.name.toUpperCase(),
                                          textAlign: TextAlign.center)),
                                ]),
                              ),
                            ))
                        .toList()),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Text('Ups $error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
