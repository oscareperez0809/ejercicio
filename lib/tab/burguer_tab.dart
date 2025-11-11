import 'package:flutter/material.dart';
import 'package:ejercicio/utils/donut_tile.dart';

class burguerTab extends StatelessWidget {
  final Function(String, double) onAddToCart; // nuevo parámetro
  burguerTab({super.key, required this.onAddToCart});

  final List DonutsSale = [
    [
      'AlphaTheta',
      '3000',
      Colors.blueGrey,
      "lib/images/AlphaTheta-DDJ-GRV6.jpg",
      'Modelo: DDJ-GRV6',
      3.8,
    ],
    [
      'Pioneer',
      '2677',
      Colors.green,
      "lib/images/Dj_Pioneer_System_XDJRX3.png",
      'Modelo: XDJRX3',
      4.4,
    ],
    [
      'Pioneer',
      '1200',
      Colors.yellow,
      "lib/images/Pioneer DDJ-FLX4.jpg",
      'Modelo:DDJ-FLX4',
      4.8,
    ],
    [
      'Pioneer',
      '4300',
      Colors.blue,
      "lib/images/Pioneer DJ DJJ-SX3 driver.jpg",
      'Modelo: DJ DJJ-SX3',
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
