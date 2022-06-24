import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'widget/tv/carousel_section_tv.dart';
import 'widget/tv/grid_section_tv.dart';

class TVShowsPage extends StatefulWidget {
  const TVShowsPage({Key? key}) : super(key: key);

  @override
  State<TVShowsPage> createState() => _TVShowsPageState();
}

class _TVShowsPageState extends State<TVShowsPage> {
  final String baseUrlTV = "https://api.themoviedb.org/3/tv/";
  final String apiKey = "api_key=c2b161509205cba8cf04c0c38aee2a75";
  final String languageKey = "language=en-US";
  final String pages = "1";

  Future<List<dynamic>> _fetchOnTheAirTV() async {
    String endPointPath = "on_the_air";
    String endPoint = baseUrlTV +
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

  Future<List<dynamic>> _fetchPopularTV() async {
    String endPointPath = "popular";
    String endPoint = baseUrlTV +
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

  Future<List<dynamic>> _fetchTopRatedTV() async {
    String endPointPath = "top_rated";
    String endPoint = baseUrlTV +
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

  Future<List<dynamic>> _fetchAiringTodayTV() async {
    String endPointPath = "airing_today";
    String endPoint = baseUrlTV +
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
              sectionTitle: 'On The Air',
              sectionSubtitle: 'Lorem Ipsum Dolor Sit Amet',
              movieListType: _fetchOnTheAirTV()),
/*Space*/
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),
/*Popular Movies*/
          CarouselSection(
              sectionTitle: 'Popular',
              sectionSubtitle: 'Lorem Ipsum Dolor Sit Amet',
              movieListType: _fetchPopularTV()),
/*Space*/
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),
/*Top Rated Movies*/
          CarouselSection(
              sectionTitle: 'Top Rated',
              sectionSubtitle: 'Lorem Ipsum Dolor Sit Amet',
              movieListType: _fetchTopRatedTV()),
/*Space*/
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),
/* Now Playing Movies */
          GridSection(
              sectionTitle: 'Airing Today',
              sectionSubtitle: 'Lorem Ipsum Dolor Sit Amet',
              movieListType: _fetchAiringTodayTV()),
        ],
      ),
    );
  }
}
