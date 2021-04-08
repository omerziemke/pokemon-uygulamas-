import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/pokemon_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokemon",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: PokemonList(),
    );
  }
}
//androidManifest.xml dosyasına gerekli eklentiler yapıldı  android:usesCleartextTraffic="true" eklendi application arasına
