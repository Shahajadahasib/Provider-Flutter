import 'package:flutter/material.dart';
import 'package:pro_vider/provider.dart';
import 'package:provider/provider.dart';

class FavMovie extends StatefulWidget {
  const FavMovie({super.key});

  @override
  State<FavMovie> createState() => _FavMovieState();
}

class _FavMovieState extends State<FavMovie> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: Text("My List (${_myList.length}"),
      ),
      body: ListView.builder(
        itemCount: _myList.length,
        itemBuilder: (_, index) {
          final currentMovie = _myList[index];
          return Card(
            key: ValueKey(currentMovie.title),
            elevation: 4,
            child: ListTile(
              title: Text(currentMovie.title),
              subtitle: Text(currentMovie.duration ?? ''),
              trailing: TextButton(
                child: const Text(
                  'Remove',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  context.read<MovieProvider>().removeToList(currentMovie);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
