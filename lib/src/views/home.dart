import 'package:coffee_talk_ibp/src/models/movie.dart';
import 'package:flutter/material.dart';

//TODO: Explain way to alias Library
import 'package:coffee_talk_ibp/src/api/api.dart' as rest_api;
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    // Chargement du mock de movies
    _loadMovies();
  }

  //TODO: Must use Async
  _loadMovies() {
    MoviesResponse movieResponse = await rest_api.topRatedMovies();
    setState(() {
      movies = movieResponse.movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          Movie movie = movies[index];
          final originalTitle = movie.originalTitle;
          final releaseDate = movie.originalTitle;

          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(
              child: Text(
                "$originalTitle - Date : $releaseDate",
                style: TextStyle(height: 3.0),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
