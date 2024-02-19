import 'package:flutter_ricky_morty_app/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_ricky_morty_app/constants/strings.dart';
import 'package:flutter_ricky_morty_app/data/models/characters.dart';
import 'package:flutter_ricky_morty_app/data/repository/characters_repo.dart';
import 'package:flutter_ricky_morty_app/data/web_services/characters_web_services.dart';
import 'package:flutter_ricky_morty_app/presentaion/screens/characters_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ricky_morty_app/presentaion/screens/Characters_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext cntxt) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext cntxt) => CharactersCubit(charactersRepository),
            child: CharacterDetailsScreen(
              character: character,
            ),
          ),
        );
    }
    return null;
  }
}
