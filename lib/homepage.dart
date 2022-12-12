import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pakemon/servise/servise.dart';
import 'infoPage/infoPage.dart';
import 'model/get_servismodel.dart';


class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokedex=[];
  var pokeApi="https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  @override
  void initState(){
    // ignore: todo
    //TODO: implement initState
    super.initState();
    if(mounted){
      fetchPokemonData();
    }
  }
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
    //  backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 8, child: _appBar()),
            Expanded(
              flex: 8,
              child: FutureBuilder(
                  future: GetPokemonService.getPokemon(),
                  builder: (context, AsyncSnapshot<PokemonModel> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ignore: unnecessary_null_comparison
                            pokedex != null ? Expanded(
                                child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    itemCount: pokedex.length
                                    , itemBuilder: (context, index) {
                                  return Stack(

                                      children: [
                                        Container(
                                          height: 155.18,
                                          width: 177,
                                          decoration: const BoxDecoration(
                                            color: Color(0xffFA5AFD),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text(pokedex[index]["num"]
                                                      .toString()),
                                                  const Text("  "),
                                                  Text(pokedex[index]["name"]),
                                                ],
                                              )
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 53,
                                            left: 20,
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (
                                                                context) =>
                                                                InfoPage(
                                                                  data: snapshot.data!.pokemon![index],)));
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Image.network(
                                                          pokedex[index]["img"])
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ))
                                      ]
                                  );
                                })


                            ) : const Center(
                              child: CircularProgressIndicator(),
                            )

                          ],
                        ),
                      );
                    }
    }),
            )
          ],
        ),
      )
    );
  }

  Column _appBar() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 31),
          child: Text("Pakemon",style: TextStyle(color: Colors.orange,fontSize: 25),)
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: TextFormField(
            showCursor: false,
            maxLength: 20,
            maxLines: 1,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "Buscar Pokemon",
                filled: true,
                fillColor: const Color(0xffE5E5E5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none)),

          ),
        ),

      ],
    );
  }
  void fetchPokemonData(){
    var url=Uri.http("raw.githubusercontent.com","/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if (value.statusCode==200) {
        var decodedJsonData=jsonDecode(value.body);
        pokedex=decodedJsonData["pokemon"];

        setState(() {

        });
      }
    });

  }
}

