import 'package:flutter/material.dart';
import 'package:ejercicio/utils/donut_tile.dart';

class smoothieTab extends StatelessWidget {
  final Function(String, double) onAddToCart; // nuevo parámetro
  smoothieTab({super.key, required this.onAddToCart});

  final List DonutsSale = [
    [
      'BEHRINGER',
      '1100',
      Colors.blueGrey,
      "lib/images/BEHRINGER.png",
      'Modelo: BEHRINGER',
      3.8,
    ],
    [
      'MONOLOGUE',
      '1300',
      Colors.green,
      "lib/images/MONOLOGUE-BK.png",
      'Modelo: BK',
      4.4,
    ],
    [
      'Novation',
      '1599',
      Colors.yellow,
      "lib/images/Novation-Bass-Station-ll.png",
      'Modelo: Bass-Station-ll',
      4.8,
    ],
    [
      'Arturia',
      '1388',
      Colors.blue,
      "lib/images/Arturia-Microfreak-25-teclas.png",
      'Modelo: Microfreak-25-teclas',
      5.0,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.6,
      ),
      itemCount: DonutsSale.length,
      itemBuilder: (context, index) {
        return DonutTile(
          DonutFlavor: DonutsSale[index][0],
          DonutPrice: DonutsSale[index][1],
          DonutColor: DonutsSale[index][2],
          DonutImage: DonutsSale[index][3],
          DonutSupplier: DonutsSale[index][4],
          DonutRating: DonutsSale[index][5],
          onAdd: () => onAddToCart(
            DonutsSale[index][0],
            double.parse(DonutsSale[index][1]),
          ),
        );
      },
    );
  }
}
