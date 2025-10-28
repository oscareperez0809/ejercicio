import 'package:flutter/material.dart';
import 'package:donut/utils/donut_tile.dart';

class DonutTab extends StatelessWidget {
  //lista de donas
  final List DonutsSale = [
    //donut flavor
    //donut price
    //donut color
    //donut image
    //donut supplier
    [
      'Chocolate',
      '90',
      Colors.brown,
      "lib/images/chocolate_donut.png",
      'Starbucks',
    ],
    [
      'Strawberry',
      '100',
      Colors.pink,
      "lib/images/strawberry_donut.png",
      'Starbucks',
    ],
    [
      'Vanilla',
      '85',
      Colors.yellow,
      "lib/images/icecream_donut.png",
      'Starbucks',
    ],
    ['Matcha', '130', Colors.green, "lib/images/grape_donut.png", 'Starbucks'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //se encarga de acomodar elementos dentro de un grid
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //numero de columnas
        crossAxisCount: 2,
         //relacion de aspecto
        childAspectRatio: 1 / 1.45,
      ),
      itemCount: DonutsSale.length,

      //lo que se va a construir en el grid
      itemBuilder: (context, index) {
        return DonutTile(
          DonutFlavor: DonutsSale[index][0],
          DonutPrice: DonutsSale[index][1],
          DonutColor: DonutsSale[index][2],
          DonutImage: DonutsSale[index][3],
          DonutSupplier: DonutsSale[index][4],
        );
      },
    );
  }
}
