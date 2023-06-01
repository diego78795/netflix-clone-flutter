import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/app/data/providers/api.dart';

class BannerRepository {
  final ApiClient? apiClient;

  BannerRepository({@required this.apiClient}) : assert(apiClient != null);

  Future getTv(int id) {
    return apiClient!.apiTv(id);
  }
}
