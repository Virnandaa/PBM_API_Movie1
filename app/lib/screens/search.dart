import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Search',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.white),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15),
                    height: 25,
                    child: const TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize: 10),
                          hintText: 'Search something...'),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 10),
                //   child: Icon(
                //     Icons.send,
                //     color: Colors.grey,
                //   ),
                // ),
              ],
            ),
            // width: double.infinity,
          ),
          TextButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.grey,
              ),
              label: const Text(
                'Back to home',
                style: TextStyle(color: Colors.grey),
              ))
        ]));
  }
}
