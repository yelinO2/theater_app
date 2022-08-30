import 'package:flutter/material.dart';
import 'package:movie_app/widgets/text.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movie_app/widgets/upcoming.dart';
import 'package:movie_app/widgets/now_playing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie API Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List upcomingMovies = [];
  List nowPlayingMovies = [];
  final String apiKey = '12db7022e82fd84755282e23d2ea8480';
  final String readAccesToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMmRiNzAyMmU4MmZkODQ3NTUyODJlMjNkMmVhODQ4MCIsInN1YiI6IjYzMGRiMjEzMjI2YzU2MDA5MmNiOTcwYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bE5ha-fuCDtGABH1Co6Bm0V5zLcUSxgU2ebHg-XeCqo';

  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    TMDB tmdbWithCustomLog = TMDB(
      ApiKeys(apiKey, readAccesToken),
    );
    const ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    );
    Map upcomingResult = await tmdbWithCustomLog.v3.movies.getUpcoming();

    Map nowPlayingResult = await tmdbWithCustomLog.v3.movies.getNowPlaying();
    setState(() {
      upcomingMovies = upcomingResult['results'];
      nowPlayingMovies = nowPlayingResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const ModifiedText(text: 'Your Theater'),
      ),
      body: ListView(
        children: [
          UpcomigMovies(upcoming: upcomingMovies),
          NowPlaying(nowPlaying: nowPlayingMovies),
        ],
      ),
    );
  }
}
