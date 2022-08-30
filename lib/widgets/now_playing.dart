import 'package:flutter/material.dart';
import 'package:movie_app/widgets/text.dart';
import 'package:movie_app/desciption.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({Key? key, required this.nowPlaying}) : super(key: key);
  final List nowPlaying;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Now Playing 🎞️',
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
                          name: nowPlaying[index]['title'],
                          description: nowPlaying[index]['overview'],
                          bannerUrl:
                              'https://image.tmdb.org/t/p/w500${nowPlaying[index]['backdrop_path']}',
                          posterUrl:
                              'https://image.tmdb.org/t/p/w500${nowPlaying[index]['poster_path']}',
                          rating: nowPlaying[index]['vote_average'].toString(),
                          launchDate: nowPlaying[index]['release_date'],
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
                                'https://image.tmdb.org/t/p/w500${nowPlaying[index]['poster_path']}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ModifiedText(
                          text: nowPlaying[index]['title'] ?? 'loading',
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: nowPlaying.length,
            ),
          ),
        ],
      ),
    );
  }
}
