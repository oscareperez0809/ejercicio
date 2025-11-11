import 'package:flutter/material.dart';
import 'package:ejercicio/utils/donut_tile.dart';

class pizzaTab extends StatelessWidget {
  final Function(String, double) onAddToCart; // nuevo parámetro
  pizzaTab({super.key, required this.onAddToCart});

  final List DonutsSale = [
    [
      'CASIO',
      '90',
      Colors.blueGrey,
      "lib/images/CT-S500.png",
      'Modelo: CT-S500',
      3.8,
    ],
    [
      'KAISER',
      '100',
      Colors.green,
      "lib/images/kaiser_MTC-5505.png",
      'Modelo: kaiser_MTC-5505',
      4.4,
    ],
    [
      'Alesis',
      '85',
      Colors.yellow,
      "lib/images/kaiser_MTC-5505.png",
      'Modelo: Melody-61_MKII',
      4.8,
    ],
    [
      'YAMAHA',
      '130',
      Colors.blue,
      "lib/images/YAMAHA_PSR-E283.png",
      'Modelo: PSR-E283',
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
