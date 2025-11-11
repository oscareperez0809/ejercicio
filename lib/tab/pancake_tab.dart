import 'package:flutter/material.dart';
import 'package:ejercicio/utils/donut_tile.dart';

class pancakeTab extends StatelessWidget {
  final Function(String, double) onAddToCart; // nuevo parámetro
  pancakeTab({super.key, required this.onAddToCart});

  final List DonutsSale = [
    [
      'Select Sound',
      '1209',
      Colors.blueGrey,
      "lib/images/BT8000.png",
      'Modelo: BT-8000',
      3.8,
    ],
    [
      'DANFI AUDIO DF',
      '1300',
      Colors.green,
      "lib/images/TANLANIN.png",
      'Modelo: TE-2017',
      4.4,
    ],
    [
      'Technics',
      '780',
      Colors.yellow,
      "lib/images/SL-1200.png",
      'Modelo: SL-1200GR',
      4.8,
    ],
    [
      'VICTROLA',
      '2000',
      Colors.blue,
      "lib/images/VICTROLA.png",
      'Modelo: Navigator',
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
