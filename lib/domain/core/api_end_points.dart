import 'package:flutter_movie_app/core/strings.dart';
import 'package:flutter_movie_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
}
