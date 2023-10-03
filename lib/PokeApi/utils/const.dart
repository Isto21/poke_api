// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';

class Utils {
  Color getColorFromType(String type) {
    switch (type) {
      case 'normal':
        return Colors.grey;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'fairy':
        return Colors.pink;
      case 'grass':
        return Colors.green;
      case 'steel':
        return const Color.fromARGB(0, 205, 212, 119);
      case 'electric':
        return Colors.yellow;
      case 'dark':
        return Colors.black54;
      case 'ice':
        return Colors.cyan;
      case 'fighting':
        return Colors.orange;
      case 'poison':
        return Colors.deepPurple;
      case 'rock':
        return Colors.brown;
      case 'flying':
        return Colors.blueAccent;
      case 'ground':
        return Colors.brown;
      case 'dragon':
        return Colors.indigo;
      case 'ghost':
        return Colors.deepPurpleAccent;
      case 'psychic':
        return Colors.purple;
      case 'bug':
        return Colors.brown;       
    }
    return Colors.white ;
  }
}
