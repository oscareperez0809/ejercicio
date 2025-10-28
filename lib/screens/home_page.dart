import 'package:donut/tab/burger_tab.dart';
import 'package:donut/tab/donut_tab.dart';
import 'package:donut/tab/pancake_tab.dart';
import 'package:donut/tab/pizza_tab.dart';
import 'package:donut/tab/smoothie_tab.dart';
import 'package:donut/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    //donut tab
    const MyTab(iconPath: 'lib/icons/donut.png', iconName: 'Donut'),
    //burger tab
    const MyTab(iconPath: 'lib/icons/burger.png', iconName: 'Burger'),
    //smoothie tab
    const MyTab(iconPath: 'lib/icons/smoothie.png', iconName: 'Smoothie'),
    //pancake tab
    const MyTab(iconPath: 'lib/icons/pancakes.png', iconName: 'Pancakes'),
    //pizza tab
    const MyTab(iconPath: 'lib/icons/pizza.png', iconName: 'Pizza'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //icono de la izquierda
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          //icono de la derecha
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            ),
          ],
        ),
        body: Column(
          children: [
            //texto principal
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text('I want to ', style: TextStyle(fontSize: 24)),
                  Text(
                    'Eat',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),

            //pestañas (TabBar)
            TabBar(tabs: myTabs),

            //contenido de pestañas tabbar view
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(),
                  burgerTab(),
                  smoothieTab(),
                  pancakeTab(),
                  pizzaTab(),
                ],
              ),
            ),
            //carrito cart
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 28),
                    child: Column(
                      //se va a la izquierda
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2 Items | \$45.00',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
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
                    onPressed: () {},
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
