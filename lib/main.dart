import 'package:flutter/material.dart';
import 'package:pokedex/app/locator.dart';
import 'package:pokedex/ui/views/home/home_view.dart';

void main() {
  setupLocator();
  runApp(PokeDexApp());
}

class PokeDexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PokeDexApp",
      home: HomeView(),
    );
  }
}
