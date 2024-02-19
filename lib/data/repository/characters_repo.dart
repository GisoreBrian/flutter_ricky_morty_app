import 'package:flutter_ricky_morty_app/data/models/characters.dart';
import 'package:flutter_ricky_morty_app/data/web_services/characters_web_services.dart';

class CharactersRepository {
  late CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

    Future<List<Character>> getAllCharacters() async {
      final characters = await charactersWebServices.getAllCharacters();
      return characters.map((character) => Character.fromJson(character)).toList();
    }

}