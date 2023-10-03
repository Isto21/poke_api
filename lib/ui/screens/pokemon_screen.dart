// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:poke_api/PokeApi/domain/entities/pokemon.dart';
import 'package:poke_api/PokeApi/utils/const.dart';

class PokemonScreen extends StatelessWidget {
  Pokemon pokemon;
  PokemonScreen({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Utils().getColorFromType(pokemon.types.first.type.name),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.favorite_border_outlined)),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Utils().getColorFromType(pokemon.types.first.type.name),
          ),
          PokemonBottonSheet(
            pokemon: pokemon,
          ),
          PokemonDetails(pokemon: pokemon),
        ],
      ),
    );
  }
}

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Theme.of(context).primaryTextTheme
              Text(
                pokemon.name.toUpperCase(),
                style: Theme.of(context).primaryTextTheme.bodyLarge,
              ),
              Text(
                '#${pokemon.order}',
                style: Theme.of(context).primaryTextTheme.bodyMedium,
              )
            ],
          ),
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: pokemon.types
                    .map(
                      (types) => Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.black26),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 3),
                            child: Text(
                              types.type.name,
                              style:
                                  Theme.of(context).primaryTextTheme.bodySmall,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                // pokemon.abilities.map((ability) => Text(ability.ability.name,style: Theme.of(context).primaryTextTheme.bodySmall,) ).toList(),
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/1.svg',
                    color: Colors.black38,
                    height: 250,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      pokemon.sprites,
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PokemonBottonSheet extends StatelessWidget {
  Pokemon pokemon;
  PokemonBottonSheet({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18))),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    PokemonStats(
                      pokemon: pokemon,
                    ),
                  ],
                ),
              ),
            )
          ]
              // pokemon.abilities.map((e) => Text(e.ability.name)).toList(),
              ),
        );
      },
    );
  }
}

class PokemonStats extends StatelessWidget {
  Pokemon pokemon;
  PokemonStats({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Pokemon Stats:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              Row(
                children: [
                  const Text('Height: '),
                  Text(pokemon.height.toString())
                ],
              ),
              Row(
                children: [
                  const Text('Weight: '),
                  Text(pokemon.weight.toString())
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: pokemon.stats
                .map((e) => Row(
                      children: [
                        Text('${e.stat.name.toUpperCase()} :'),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: LinearProgressIndicator(
                            color: Utils().getColorFromType(
                                pokemon.types.first.type.name),
                            value: e.baseStat.toDouble() * 0.001,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(e.baseStat.toString())
                      ],
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Pokemon Abilities:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: pokemon.abilities
                    .map((e) => Row(
                          children: [
                            Text(e.ability.name.toUpperCase()),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
