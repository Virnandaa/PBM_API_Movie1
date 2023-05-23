import 'package:flutter/material.dart';
import 'package:movieapp/screens/movie_details.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {super.key,
      required this.rating,
      required this.title,
      required this.year,
      required this.imageUrl,
      required this.id,
      required this.isFavorite});

  final String title;
  final double rating;
  final String year;
  final int id;
  final String imageUrl;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetails(
              title: title,
              id: id,
              isFavorite: isFavorite,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: 200,
            width: double.infinity,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(imageUrl),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                      child: Text(
                                    title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ))
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "${rating.toString()}/10",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (isFavorite)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red,
                                  ),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Favorit',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: const [
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.blueAccent,
                                ),
                                Text(
                                  'See details',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey)
        ],
      ),
    );
  }
}
