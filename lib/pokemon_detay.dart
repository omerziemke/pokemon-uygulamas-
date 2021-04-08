import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/models/pokedex.dart';

class PokemonDetay extends StatelessWidget {
  Pokemon pokemon;

  PokemonDetay({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        title: Text(
          "${pokemon.name} Detayları",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Stack(children: [
        Positioned(
          height: MediaQuery.of(context).size.height * (7 / 10),
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height :" + pokemon.height,
                  ),
                  Text(
                    "Weight :" + pokemon.weight,
                  ),
                  Text(
                    "Type ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((tip) => Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList(),
                  ),
                  Text(
                    "pre Evolation ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution != null
                        ? pokemon.prevEvolution
                            .map((evolotion) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  evolotion.name,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("En kücük Hali")],
                  ),
                  Text(
                    "Next Evolation ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null
                        ? pokemon.nextEvolution
                            .map((evolotion) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  evolotion.name,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("Son Hali")],
                  ),
                  Text(
                    "Weekness ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses != null
                        ? pokemon.weaknesses
                            .map((weekness) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  weekness,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("Zayıflığı yok")],
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.img,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(pokemon.img), fit: BoxFit.cover),
                  ),
                ))),
      ]),
    );
  }
}
