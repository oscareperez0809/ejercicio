import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cart;
  final Function(int) onRemoveItem;

  const CartPage({super.key, required this.cart, required this.onRemoveItem});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double total = widget.cart.fold(0, (sum, item) => sum + item['price']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.pink,
      ),
      body: widget.cart.isEmpty
          ? const Center(child: Text('Your cart is empty 😢'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cart.length,
                    itemBuilder: (context, index) {
                      final item = widget.cart[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.album, color: Colors.pink),
                          title: Text(item['name']),
                          subtitle: Text(
                            '\$${item['price'].toStringAsFixed(2)}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              widget.onRemoveItem(index);
                              setState(() {}); // actualiza la vista local
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: \$${total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Compra realizada 💳'),
                            ),
                          );
                        },
                        child: const Text('Buy Now'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
