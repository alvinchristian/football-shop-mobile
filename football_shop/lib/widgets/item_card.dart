import 'package:flutter/material.dart';
import 'package:football_shop/screens/product_form.dart';
import 'package:football_shop/screens/menu.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  bool get isAllProducts => item.name == "All Products";

  Color _getColor(String name) {
    switch (name) {
      case "All Products":
        return Colors.white;
      case "My Products":
        return Colors.green;
      case "Create Product":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _getColor(item.name),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isAllProducts
            ? const BorderSide(color: Colors.black, width: 2) 
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
            );

          if (item.name == "Create Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductFormPage(),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: isAllProducts ? Colors.black : Colors.white,  
                  size: 30.0,
                ),
                const SizedBox(height: 3),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isAllProducts ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
