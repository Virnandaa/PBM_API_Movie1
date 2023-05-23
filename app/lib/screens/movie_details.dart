import 'package:flutter/material.dart';
import 'package:movieapp/widgets/genres.dart';
import 'package:provider/provider.dart';
import 'package:movieapp/providers/movies.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails(
      {super.key,
      required this.title,
      required this.id,
      required this.isFavorite});
  final String title;
  final int id;
  bool isFavorite;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late Future future;
  @override
  void initState() {
    future =
        Provider.of<Movies>(context, listen: false).getMovieDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Provider.of<Movies>(context, listen: false).setLikes(widget.id);
            setState(() {
              widget.isFavorite = !widget.isFavorite;
            });
          },
          child: widget.isFavorite
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border_outlined),
        ),
        body: FutureBuilder(
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/viewphoto',
                        arguments: snapshot.data!.imageUrl),
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(snapshot.data!.imageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        color: Colors.black,
                        child: Text(
                          "${snapshot.data!.title} (${snapshot.data!.year})",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Sinopsis',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(snapshot.data!.overview),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Genres',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Genres(name: snapshot.data!.genres),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Rating',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      size: 40,
                                      Icons.star_rounded,
                                      color: Colors.green,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${snapshot.data!.rating.toString()}/10",
                                      style: const TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                                Text(
                                  "from ${snapshot.data!.votecount.toString()} votes",
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          future: future,
        ));
  }
}
