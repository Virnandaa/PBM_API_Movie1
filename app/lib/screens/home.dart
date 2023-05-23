import 'package:flutter/material.dart';
import 'package:movieapp/widgets/movie_card.dart';
import 'package:provider/provider.dart';
import '../providers/movies.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future future;
  @override
  void initState() {
    future = Provider.of<Movies>(context, listen: false).fetchMovieData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<Movies>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PBMovie',
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/search'),
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) => MovieCard(
                          isFavorite: movies.list[index].favorite,
                          title: movies.list[index].title,
                          imageUrl: movies.list[index].imageUrl,
                          rating: movies.list[index].rating,
                          year: movies.list[index].year,
                          id: movies.list[index].id,
                        ),
                    itemCount: movies.list.length),
      ),
    );
  }
}
