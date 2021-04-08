import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/models/pokedex.dart';
import 'package:flutter_pokemon_app/pokemon_detay.dart';
import 'package:http/http.dart' as http;

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  Pokedex pokedex;
  Future<Pokedex> veri;
  Future<Pokedex> PokemonlariGetir() async {
    final reposite = await http.get(Uri.https("raw.githubusercontent.com",
        "Biuni/PokemonGO-Pokedex/master/pokedex.json"));
    var decodedJson = json.decode(reposite.body);
    pokedex = Pokedex.fromJson(decodedJson);
    return pokedex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veri = PokemonlariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon"),
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            //yani dikey durumda ise
            return FutureBuilder(
                future: veri,
                builder: (context, AsyncSnapshot<Pokedex> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GridView.count(
                      crossAxisCount: 2,
                      children: snapshot.data.pokemon.map((poke) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PokemonDetay(
                                      pokemon: poke,
                                    )));
                          },
                          child: Hero(
                              tag: poke.img,
                              child: Card(
                                elevation: 6,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 150,
                                        width: 100,
                                        child: FadeInImage.assetNetwork(
                                          placeholder: "assets/giphy.gif",
                                          image: poke.img,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      poke.name,
                                      style: TextStyle(fontSize: 22),
                                    )
                                  ],
                                ),
                              )),
                        );
                      }).toList(),
                    );
                  }
                });
          } else {
            return FutureBuilder(
                future: veri,
                builder: (context, AsyncSnapshot<Pokedex> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GridView.extent(
                      maxCrossAxisExtent: 250,
                      children: snapshot.data.pokemon.map((poke) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PokemonDetay(
                                      pokemon: poke,
                                    )));
                          },
                          child: Hero(
                              tag: poke.img,
                              child: Card(
                                elevation: 6,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 160,
                                      width: 120,
                                      child: FadeInImage.assetNetwork(
                                        placeholder: "assets/giphy.gif",
                                        image: poke.img,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Text(
                                      poke.name,
                                      style: TextStyle(fontSize: 22),
                                    )
                                  ],
                                ),
                              )),
                        );
                      }).toList(),
                    );
                  }
                });
          }
        },
      ),
    );
  }
}
