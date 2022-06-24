import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'widget/movie/carousel_section_movie.dart';
import 'widget/movie/grid_section_movie.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final String baseUrlMovie = "https://api.themoviedb.org/3/movie/";
  final String apiKey = "api_key=c2b161509205cba8cf04c0c38aee2a75";
  final String languageKey = "language=en-US";
  final String pages = "1";

  Future<List<dynamic>> _fetchUpcomingMovies() async {
    String endPointPath = "upcoming";
    String endPoint = baseUrlMovie +
        endPointPath +
        "?" +
        apiKey +
        "&" +
        languageKey +
        "&page=" +
        pages;
    var response = await http.get(Uri.parse(endPoint));
    return json.decode(response.body)['results'];
  }

  Future<List<dynamic>> _fetchPopularMovies() async {
    String endPointPath = "popular";
    String endPoint = baseUrlMovie +
        endPointPath +
        "?" +
        apiKey +
        "&" +
        languageKey +
        "&page=" +
        pages;
    var response = await http.get(Uri.parse(endPoint));
    return json.decode(response.body)['results'];
  }

  Future<List<dynamic>> _fetchTopRatedMovies() async {
    String endPointPath = "top_rated";
    String endPoint = baseUrlMovie +
        endPointPath +
        "?" +
        apiKey +
        "&" +
        languageKey +
        "&page=" +
        pages;
    var response = await http.get(Uri.parse(endPoint));
    return json.decode(response.body)['results'];
  }

  Future<List<dynamic>> _fetchPlayingMovies() async {
    String endPointPath = "now_playing";
    String endPoint = baseUrlMovie +
        endPointPath +
        "?" +
        apiKey +
        "&" +
        languageKey +
        "&page=" +
        pages;
    var response = await http.get(Uri.parse(endPoint));
    return json.decode(response.body)['results'];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: ListView(
        children: [
/*Upcoming Movies*/
          CarouselSection(
              sectionTitle: 'Upcoming',
              sectionSubtitle: 'Lorem Ipsum Dolor Sit Amet',
              movieListType: _fetchUpcomingMovies()),
/*Space*/
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),
/*Popular Movies*/
          CarouselSection(
              sectionTitle: 'Popular',
              sectionSubtitle: 'Lorem Ipsum Dolor Sit Amet',
              movieListType: _fetchPopularMovies()),
/*Space*/
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),
/*Top Rated Movies*/
          CarouselSection(
              sectionTitle: 'Top Rated',
              sectionSubtitle: 'Lorem Ipsum Dolor Sit Amet',
              movieListType: _fetchTopRatedMovies()),
/*Space*/
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),
/* Now Playing Movies */
          GridSection(
              sectionTitle: 'Now Playing',
              sectionSubtitle: 'Lorem Ipsum Dolor Sit Amet',
              movieListType: _fetchPlayingMovies()),
        ],
      ),
    );
  }
}
