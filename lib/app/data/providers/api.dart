import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/app/data/model/movie_model.dart';
import 'package:netflix_clone_flutter/app/data/model/banner_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3";

const apiKey = "59584b0ac2fbdd20ba3c1c86f06a7c6d";

class ApiClient {
  final http.Client? httpClient;

  ApiClient({@required this.httpClient});

  Future<List<MovieModel>> apiOriginals() async {
    try {
      final response = await httpClient!.get(Uri.parse(
          '$baseUrl/discover/tv?with_network=213&language=pt-BR&api_key=$apiKey'));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body)["results"];
        return jsonResponse
            .map((movieJson) => MovieModel.fromJson(movieJson))
            .toList();
      } else {
        debugPrint('Error -apiOriginals');
      }
    } catch (e) {
      debugPrint('Error fetching from API $e');
    }
    return [];
  }

  Future<List<MovieModel>> apiTrending() async {
    try {
      final response = await httpClient!.get(Uri.parse(
          '$baseUrl/trending/all/week?language=pt-BR&api_key=$apiKey'));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body)["results"];
        return jsonResponse.map((movieJson) {
          return MovieModel.fromJson(movieJson);
        }).toList();
      } else {
        debugPrint('Error -apiTrending');
      }
    } catch (e) {
      debugPrint('Error fetching from API $e');
    }
    return [];
  }

  Future<List<MovieModel>> apiTopRated() async {
    try {
      final response = await httpClient!.get(
          Uri.parse('$baseUrl/movie/top_rated?language=pt-BR&api_key=$apiKey'));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body)["results"];
        return jsonResponse
            .map((movieJson) => MovieModel.fromJson(movieJson))
            .toList();
      } else {
        debugPrint('Error -apiTopRated');
      }
    } catch (e) {
      debugPrint('Error fetching from API $e');
    }
    return [];
  }

  Future<List<MovieModel>> apiGenreMovies(int idGenre) async {
    try {
      final response = await httpClient!.get(Uri.parse(
          '$baseUrl/discover/movie?with_genres=$idGenre&language=pt-BR&api_key=$apiKey'));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body)["results"];
        return jsonResponse
            .map((movieJson) => MovieModel.fromJson(movieJson))
            .toList();
      } else {
        debugPrint('Error -apiGenreMovies$idGenre');
      }
    } catch (e) {
      debugPrint('Error fetching from API $e');
    }
    return [];
  }

  Future<Object> apiTv(int idTv) async {
    try {
      final response = await httpClient!
          .get(Uri.parse('$baseUrl/tv/$idTv?language=pt-BR&api_key=$apiKey'));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return BannerModel.fromJson(jsonResponse);
      } else {
        debugPrint('Error -apiTv');
      }
    } catch (e) {
      debugPrint('Error fetching from API $e');
    }
    return {};
  }
}
