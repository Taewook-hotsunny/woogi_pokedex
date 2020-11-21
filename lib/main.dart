import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/bindings/authBinding.dart';
import 'package:pokedex/utils/root.dart';

void main() {
  runApp(PokeDexApp());
}

class PokeDexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      home: Root(),
      theme: ThemeData.dark(),
    );
  }
}
