import 'package:coffee_talk_ibp/src/models/movie.dart';
import 'package:coffee_talk_ibp/src/views/movies.dart';
import 'package:flutter/material.dart';

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

  _loadMovies() async {
    MoviesResponse movieResponse = await rest_api.topRatedMovies();
    setState(() {
      movies = movieResponse.movies;
    });
  }

  //TODO: 3- Explain Navigation POP & PUSH
  _handleShowFavorites() => Navigator.popAndPushNamed(context, '/favorites');

  // Drawer is a ListView with entries
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              //TODO : 5- Use Image.asset("images/ibp.png",)
              //TODO : 6- Explain how to ensure image from pubspec.yaml
              child: Text("Menu"),
            ),
          ),
          const ListTile(
            leading: const Icon(Icons.assessment),
            title: const Text('Home'),
            selected: true,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Favorites'),
            onTap: _handleShowFavorites,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //TODO: 4- Explain Way to display Drawer
      drawer: _buildDrawer(context),
      body: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          Movie movie = movies[index];
          return MovieWidget(movie);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
