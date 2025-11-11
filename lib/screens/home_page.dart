// Importa las diferentes pestañas (tabs) de la app
import 'package:ejercicio/tab/burguer_tab.dart';
import 'package:ejercicio/tab/donut_tab.dart';
import 'package:ejercicio/tab/pancake_tab.dart';
import 'package:ejercicio/tab/pizza_tab.dart';
import 'package:ejercicio/tab/smoothie_tab.dart';
import 'package:ejercicio/cart_page.dart';

// Importa el widget personalizado "MyTab" que muestra los íconos de las pestañas
import 'package:ejercicio/utils/my_tab.dart';

// Importa el paquete principal de Flutter para usar widgets
import 'package:flutter/material.dart';

// Clase principal que representa la pantalla de inicio (HomePage)
class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Constructor con clave opcional

  @override
  State<HomePage> createState() => _HomePageState(); // Crea el estado asociado
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/albumes.png', iconName: 'Albumes'),
    const MyTab(iconPath: 'lib/icons/controlador.png', iconName: 'Controlador'),
    const MyTab(
      iconPath: 'lib/icons/sintetizador.png',
      iconName: 'Sintetizadores',
    ),
    const MyTab(iconPath: 'lib/icons/tocadisco.png', iconName: 'Tocadiscos'),
    const MyTab(iconPath: 'lib/icons/teclado.png', iconName: 'Teclados'),
  ];

  // 🛒 Lista del carrito
  List<Map<String, dynamic>> cart = [];

  // Función para agregar al carrito
  void addToCart(String name, double price) {
    setState(() {
      cart.add({'name': name, 'price': price});
    });
  }

  double get totalPrice => cart.fold(0, (sum, item) => sum + item['price']);
  int get totalItems => cart.length;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            ),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text('I want to ', style: TextStyle(fontSize: 24)),
                  Text(
                    'Wish',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            TabBar(tabs: myTabs),
            Expanded(
              child: TabBarView(
                children: [
                  // 🔹 DonutTab modificado para recibir el callback
                  DonutTab(onAddToCart: addToCart),
                  burguerTab(onAddToCart: addToCart),
                  smoothieTab(onAddToCart: addToCart),
                  pancakeTab(onAddToCart: addToCart),
                  pizzaTab(onAddToCart: addToCart),
                ],
              ),
            ),

            // 🛒 Carrito inferior
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$totalItems Items | \$${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Delivery Charges Included',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(
                            cart: cart,
                            onRemoveItem: (index) {
                              setState(() {
                                cart.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },

                    child: const Text(
                      'View Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
