import 'package:flutter_ricky_morty_app/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

Future<List<dynamic>> getAllCharacters() async {
  try {
    Response response = await dio.get('character');

    if (response.statusCode == 200) {
      final results = response.data['results'];
      return results;
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}


}
