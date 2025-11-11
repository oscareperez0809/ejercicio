import 'package:flutter/material.dart';
import 'package:ejercicio/utils/donut_tile.dart';

class DonutTab extends StatelessWidget {
  final Function(String, double) onAddToCart; // nuevo parámetro
  DonutTab({super.key, required this.onAddToCart});

  final List DonutsSale = [
    [
      'DS2EVER',
      '90',
      Colors.blueGrey,
      "lib/images/ds2ever_fixed.png",
      'GUNNA',
      3.8,
    ],
    ['SOS', '100', Colors.green, "lib/images/SOS_fixed.png", 'SZA', 4.4],
    [
      'HEELS HAVE EYES 3',
      '85',
      Colors.yellow,
      "lib/images/HHE3_fixed.png",
      'Westside Gunn',
      4.8,
    ],
    [
      'Nevermind',
      '130',
      Colors.blue,
      "lib/images/nevermind_fixed.png",
      'NIRVANA',
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
