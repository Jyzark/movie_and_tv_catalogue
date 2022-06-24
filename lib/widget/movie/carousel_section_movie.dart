import 'package:flutter/material.dart';
import '/widget/section.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection(
      {Key? key,
      required this.sectionTitle,
      required this.sectionSubtitle,
      required this.movieListType})
      : super(key: key);

  final String sectionTitle;
  final String sectionSubtitle;
  final Future<List<dynamic>> movieListType;

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Section(
            sectionTitle: widget.sectionTitle,
            sectionSubtitle: widget.sectionSubtitle),
        FutureBuilder(
            future: widget.movieListType,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return CarouselSlider.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(250, 0, 0, 0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.4),
                                  BlendMode.srcOver),
                              image: snapshot.data[index]['poster_path'] != null
                                  ? NetworkImage(
                                      'https://image.tmdb.org/t/p/w500/' +
                                          snapshot.data[index]['poster_path'],
                                    )
                                  : const NetworkImage(
                                      'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
                                    ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                snapshot.data[index]['title'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    snapshot.data[index]['vote_average']
                                        .toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.amber,
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  options: CarouselOptions(
                      aspectRatio: (16 / 9),
                      viewportFraction: 1,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 100),
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ],
    );
  }
}
