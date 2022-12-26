import 'package:pokedex/objectbox.g.dart';
import 'package:pokedex/pokemon_model.dart';
import 'package:pokedex/utils/initialization.dart';

class Objectbox {
  late final Store _store;
  late final Box<Pokemon> _pokemonBox;
  Objectbox._init(this._store) {
    _pokemonBox = Box<Pokemon>(_store);
  }

  static Future<Objectbox> init() async {
    String path = '${directoryApp!.path}\\pokemon\\db';
    final store = await openStore(directory: path);
    return Objectbox._init(store);
  }

  Pokemon? getPokemon(int id) => _pokemonBox.get(id);
  int insertPokemon(Pokemon pokemon) => _pokemonBox.put(pokemon);
  bool deletePokemon(int id) => _pokemonBox.remove(id);
  List<Pokemon> getAllPokemons() => _pokemonBox.getAll();
  bool containPokemon(int id) => _pokemonBox.contains(id);
  void clear() => _pokemonBox.removeAll();
}