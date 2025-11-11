import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String DonutFlavor;
  final String DonutPrice;
  final dynamic DonutColor;
  final String DonutImage;
  final String DonutSupplier;
  final double DonutRating;

  // 🔹 Nuevo parámetro: callback para agregar al carrito
  final void Function()? onAdd;

  const DonutTile({
    super.key,
    required this.DonutFlavor,
    required this.DonutPrice,
    this.DonutColor,
    required this.DonutImage,
    required this.DonutSupplier,
    this.DonutRating = 4.5,
    this.onAdd, // <- agregado
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: DonutColor[50],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Precio
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: DonutColor[100],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  child: Text(
                    '\$$DonutPrice',
                    style: TextStyle(
                      color: DonutColor[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),

            // Imagen
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Image.asset(DonutImage),
            ),

            // Nombre
            Text(
              DonutFlavor,
              style: TextStyle(
                color: DonutColor[800],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Artista
            Text(DonutSupplier, style: TextStyle(color: Colors.grey[600])),

            // Estrellas
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  if (index < DonutRating.floor()) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    );
                  } else if (index < DonutRating) {
                    return const Icon(
                      Icons.star_half,
                      color: Colors.amber,
                      size: 20,
                    );
                  } else {
                    return const Icon(
                      Icons.star_border,
                      color: Colors.amber,
                      size: 20,
                    );
                  }
                }),
              ),
            ),

            // Botones
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite, color: Colors.pink[400]),
                  TextButton(
                    onPressed: onAdd, // ✅ ahora usa el callback
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
