import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/app/data/providers/api.dart';

class MovieRepository {
  final ApiClient? apiClient;

  MovieRepository({@required this.apiClient}) : assert(apiClient != null);

  Future getOriginals() {
    return apiClient!.apiOriginals();
  }

  Future getTrending() {
    return apiClient!.apiTrending();
  }

  Future getTopRated() {
    return apiClient!.apiTopRated();
  }

  Future getGenreMovies(int idGenre) {
    return apiClient!.apiGenreMovies(idGenre);
  }

  getTv(int idRandomMovie) {}
}
