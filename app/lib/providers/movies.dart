import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import 'dart:convert';
import '../models/moviedetails.dart';

class Movies extends ChangeNotifier {
  List<Movie> _list = [];

  List<Movie> get list {
    return _list;
  }

  Future<void> fetchMovieData() async {
    List<Movie> temporaryList = [];
    final url = Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=dbcfecebada855447ced97cf5bf08829");
    final data = await http.get(url);
    final List<dynamic> convertedData = json.decode(data.body)['results'];

    for (var element in convertedData) {
      temporaryList.add(Movie.fromJson(element));
    }
    _list = temporaryList;
  }

  Future<MovieDet> getMovieDetails(int id) async {
    final url = Uri.parse(
        "https://api.themoviedb.org/3/movie/$id?api_key=dbcfecebada855447ced97cf5bf08829");
    final data = await http.get(url);
    final Map<String, dynamic> convertedData = json.decode(data.body);
    List<String> genres = [];
    for (var i in convertedData['genres']) {
      genres.add(i['name']);
    }

    return MovieDet.fromJson(convertedData, genres);
  }

  void setLikes(
    int id,
  ) {
    final index = _list.indexWhere((element) => element.id == id);
    _list[index].favorite = !_list[index].favorite;
    notifyListeners();
  }
}
