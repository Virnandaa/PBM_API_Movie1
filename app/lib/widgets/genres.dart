import 'package:flutter/material.dart';

class Genres extends StatelessWidget {
  const Genres({super.key, required this.name});
  final List<String> name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          height: 10,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.red),
          child: Text(
            name[index],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        itemCount: name.length,
      ),
    );
  }
}
