import 'package:flutter/material.dart';
import 'package:movie_app/desciption.dart';
import 'package:movie_app/widgets/text.dart';

class UpcomigMovies extends StatelessWidget {
  const UpcomigMovies({Key? key, required this.upcoming}) : super(key: key);
  final List upcoming;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Upcoming Movies 🎥',
            size: 26,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: upcoming[index]['title'],
                          description: upcoming[index]['overview'],
                          bannerUrl:
                              'https://image.tmdb.org/t/p/w500${upcoming[index]['backdrop_path']}',
                          posterUrl:
                              'https://image.tmdb.org/t/p/w500${upcoming[index]['poster_path']}',
                          rating: upcoming[index]['vote_average'].toString(),
                          launchDate: upcoming[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${upcoming[index]['poster_path']}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ModifiedText(
                          text: upcoming[index]['title'] ?? 'loading',
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: upcoming.length,
            ),
          ),
        ],
      ),
    );
  }
}
