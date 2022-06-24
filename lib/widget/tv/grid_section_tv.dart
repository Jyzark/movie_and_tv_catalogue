import 'package:flutter/material.dart';
import '/widget/section.dart';

class GridSection extends StatelessWidget {
  const GridSection(
      {Key? key,
      required this.sectionTitle,
      required this.sectionSubtitle,
      required this.movieListType})
      : super(key: key);

  final String sectionTitle;
  final String sectionSubtitle;
  final Future<List<dynamic>> movieListType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Section(sectionTitle: sectionTitle, sectionSubtitle: sectionSubtitle),
        FutureBuilder(
            future: movieListType,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 10,
                    // width / height: fixed for *all* items
                    childAspectRatio: 0.46,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Stack(alignment: Alignment.topCenter, children: [
                            Image.network(
                              snapshot.data[index]['poster_path'] != null
                                  ? 'https://image.tmdb.org/t/p/w500/' +
                                      snapshot.data[index]['poster_path']
                                  : 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
                              width: 400,
                              height: 245,
                              fit: BoxFit.cover,
                            ),
                          ]),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshot.data[index]['name'],
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(snapshot.data[index]['vote_average']
                                        .toString()),
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    OutlinedButton(
                                        onPressed: () {},
                                        child: const Text('View Detail')),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ],
    );
  }
}
