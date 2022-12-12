
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../model/get_servismodel.dart';

class InfoPage extends StatelessWidget {
  final Pokemon data;
  const InfoPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Pokemon",style: TextStyle(color: Colors.red,fontSize: 35),)),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child:  Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: TextFormField(
                showCursor: false,
                maxLength: 15,
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.num.toString(),style: const TextStyle(color: Color(0xffFC7CFF)),),
                  Text(data.name.toString(),style: const TextStyle(color: Colors.black,fontSize: 15,wordSpacing: 5),)
                ],

              ),
            ),
            Container(
              width: 371,
                height: 205,
               decoration: BoxDecoration(
                 color: const Color(0xffFC7CFF),
                 borderRadius: BorderRadius.circular(30),
               ),
              child: Positioned(child: Column(
                children: [
                  Image.network(data.img.toString(),fit: BoxFit.fitHeight),
                ],
              )) ,
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 22),
                child: Row(
                     mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    Container(
                      height: 38,
                      width: 174,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.orange, ),

                      child: const Align(
                          alignment: Alignment.bottomCenter,
                          child:Text("Fuego")
                    ),),
                    const SizedBox(height: 20,),
                    Container(
                      height: 38,
                      width: 174,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff0083FC),  ),

                      child:const Align(
                          alignment: Alignment.bottomCenter,
                          child:Text("Volago"),
                    ))
                  ],
                ),
              ),
            Container(
              width: 415,
              height: 309,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: const Color(0xffFA5AFD)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 41,vertical:27 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       children: [
                         Column(
                           children: [
                             const Text("Altura",style: TextStyle(color: Colors.white),),
                             Text(data.height.toString(),style: const TextStyle(color: Colors.white)),
                             const SizedBox(height: 41,),
                             const Text("Peso",style: TextStyle(color: Colors.white)),
                             Text(data.weight.toString(),style: const TextStyle(color: Colors.white)),
                             const SizedBox(height: 41,),
                             const Text("Habibilidades",style: TextStyle(color: Colors.white),),
                             const Text("Mar Llamas",style: TextStyle(color: Colors.white)),
                           ],
                         )
                       ],
                     ),
                     Row(
                       children: [
                         Column(
                           children: const[
                             Text("Categoria",style: TextStyle(color: Colors.white),),
                             Text("Llama",style: TextStyle(color: Colors.white)),
                             SizedBox(height: 41,),
                             Text("Sexo",style: TextStyle(color: Colors.white)),
                             Icon(Icons.stacked_line_chart_outlined),

                           ],
                         )
                       ],
                     ),
                     Row(
                       children: [
                         Column(
                           children: const [
                              Text("Debilidad",style: TextStyle(color: Colors.white),),
                           ],
                         )
                       ],
                     ),
                   ],
                ),
              ),
            ),


          ],
        )


    );
  }
}
