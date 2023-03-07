import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/objectbox.g.dart';
import 'package:pokedex/utils/core.dart';

class Objectbox {
  late final Store _store;
  late final Box<PokemonModel> _pokemonBox;
  Objectbox._init(this._store) {
    _pokemonBox = Box<PokemonModel>(_store);
  }

  static Future<Objectbox> init() async {
    String path = '${directoryApp!.path}\\db\\';

    final store = await openStore(directory: path);
    return Objectbox._init(store);
  }

  bool isEmpty() => _pokemonBox.isEmpty();

  PokemonModel? getPokemon(int id) => _pokemonBox.get(id);
  int insertPokemon(PokemonModel pokemon) => _pokemonBox.put(pokemon);
  bool deletePokemon(int id) => _pokemonBox.remove(id);
  List<PokemonModel> getAllPokemons() => _pokemonBox.getAll();
  bool containPokemon(int id) => _pokemonBox.contains(id);
  void clear() => _pokemonBox.removeAll();
}
