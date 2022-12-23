import 'package:pokedex/objectbox.g.dart';
import 'package:pokedex/pokemon_model.dart';

class Objectbox {
  late final Store _store;
  late final Box<Pokemon> _pokemonBox;
  Objectbox._init(this._store) {
    _pokemonBox = Box<Pokemon>(_store);
  }

  static Future<Objectbox> init() async {
    final store = await openStore();
    return Objectbox._init(store);
  }

  Pokemon? getPokemon(int id) => _pokemonBox.get(id);
  int insertPokemon(Pokemon pokemon) => _pokemonBox.put(pokemon);
  bool deletePokemon(int id) => _pokemonBox.remove(id);
  List<Pokemon> getPokemons() => _pokemonBox.getAll();
  void clear() => _pokemonBox.removeAll();
}
