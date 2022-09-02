import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pro_vider/fav_movie.dart';
import 'package:pro_vider/provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FavMovie(),
                  ),
                );
              },
              icon: const Icon(Icons.favorite),
              label: Text(
                "Go to my list(${myList.length})",
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (_, index) {
                  final currentmovie = movies[index];
                  return Card(
                    elevation: 4,
                    key: ValueKey(currentmovie.title),
                    color: Colors.blue,
                    child: ListTile(
                      title: Text(
                        currentmovie.title,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        currentmovie.duration ?? " No information ",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: myList.contains(currentmovie)
                              ? Colors.red
                              : Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          if (!myList.contains(currentmovie)) {
                            log('1');
                            context
                                .read<MovieProvider>()
                                .addToList(currentmovie);
                          } else {
                            log('2');
                            context
                                .read<MovieProvider>()
                                .removeToList(currentmovie);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
