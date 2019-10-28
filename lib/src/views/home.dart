import 'package:coffee_talk_ibp/src/mock/movies.dart';
import 'package:coffee_talk_ibp/src/models/movie.dart';
import 'package:flutter/material.dart';

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

  _loadMovies() {
    // TODO init movies from Mock
    // movies = getMockMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          Movie movie = movies[index];
          // TODO: Init originalTitle  = movie.originalTitle
          final originalTitle;
          // TODO: Init releaseDate  = movie.releaseDate
          final releaseDate;

          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(
                //TODO : Init Text for Movie
                /*child: Text(
                "$originalTitle - Date : $releaseDate",
                style: TextStyle(height: 3.0),
              ),*/
                ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
