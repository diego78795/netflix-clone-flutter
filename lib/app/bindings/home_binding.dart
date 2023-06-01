import 'package:netflix_clone_flutter/app/data/providers/api.dart';
import 'package:netflix_clone_flutter/app/controllers/home_controller.dart';
import 'package:netflix_clone_flutter/app/data/repository/banner_repository.dart';
import 'package:netflix_clone_flutter/app/data/repository/movie_repository.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(
        movieRepository:
            MovieRepository(apiClient: ApiClient(httpClient: http.Client())),
        bannerRepository:
            BannerRepository(apiClient: ApiClient(httpClient: http.Client()))));
  }
}
