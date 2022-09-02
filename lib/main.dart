import 'package:flutter/material.dart';
import 'package:pro_vider/provider.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (_) => MovieProvider(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
