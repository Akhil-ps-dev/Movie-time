import 'package:flutter_movie_app/core/strings.dart';
import 'package:flutter_movie_app/infrastructure/api_key.dart';

//path(base_url)
//lib\core\strings.dart

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const search = "$kBaseUrl/search/movie?api_key=$apiKey";
  static const hotAndNewMovie = "$kBaseUrl/discover/movie?api_key=$apiKey";
  static const hotAndNewTv = "$kBaseUrl/discover/tv?api_key=$apiKey";
}
