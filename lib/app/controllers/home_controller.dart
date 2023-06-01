import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone_flutter/app/data/model/banner_model.dart';
import 'dart:math';
import 'package:netflix_clone_flutter/app/data/model/movie_model.dart';
import 'package:netflix_clone_flutter/app/data/repository/banner_repository.dart';
import 'package:netflix_clone_flutter/app/data/repository/movie_repository.dart';

class HomeController extends GetxController {
  final MovieRepository? movieRepository;
  final BannerRepository? bannerRepository;
  HomeController(
      {@required this.movieRepository, @required this.bannerRepository})
      : assert(movieRepository != null, bannerRepository != null);

  bool isLoading = true;
  List<Map<String, dynamic>> movieList = [];
  BannerModel movieBanner = BannerModel();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    movieBanner = await getFeaturedMovie();
    movieList.add(await getTrending());
    movieList.add(await getTopRated());
    movieList.add(await getGenreMovies('Romance/Drama', 18));
    movieList.add(await getGenreMovies('Ação', 28));
    movieList.add(await getGenreMovies('Comedia', 35));
    movieList.add(await getGenreMovies('Aventura', 12));
    movieList.add(await getGenreMovies('Documentarios', 99));
    isLoading = false;
    update();
  }

  Future<BannerModel> getFeaturedMovie() async {
    Map<String, dynamic> category = await getOriginals();
    movieList.add(category);
    List<MovieModel> movies = category['items'];
    int randomMovie = Random().nextInt(movies.length - 1);
    int idRandomMovie = movies[randomMovie].id;
    return await bannerRepository?.getTv(idRandomMovie);
  }

  Future<Map<String, dynamic>> getOriginals() async {
    Map<String, dynamic> category = {};
    category['title'] = 'Originais do Netflix';
    category['items'] = await movieRepository?.getOriginals();
    return category;
  }

  Future<Map<String, dynamic>> getTrending() async {
    Map<String, dynamic> category = {};
    category['title'] = 'Recomendados para Você';
    category['items'] = await movieRepository?.getTrending();
    return category;
  }

  Future<Map<String, dynamic>> getTopRated() async {
    Map<String, dynamic> category = {};
    category['title'] = 'Em Alta';
    category['items'] = await movieRepository?.getTopRated();
    return category;
  }

  Future<Map<String, dynamic>> getGenreMovies(String title, int idGenre) async {
    Map<String, dynamic> category = {};
    category['title'] = title;
    category['items'] = await movieRepository?.getGenreMovies(idGenre);
    return category;
  }
}
