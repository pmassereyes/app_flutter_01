import 'package:flutter/material.dart';
class Boutique extends StatefulWidget {
  const Boutique({super.key});

  @override
  State<Boutique> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Boutique> {
  final categories = [
    {"title": "Shampoings", "icon": Icons.shower},
    {"title": "Huiles/Crèmes", "icon": Icons.water_drop},
    {"title": "Bonnets/Cap", "icon": Icons.checkroom},
    {"title": "Accessoires", "icon": Icons.cut}

  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,        
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: categories.map((cat) {
            return GestureDetector(
              onTap: () {
                // Action au clic
              },
              child: Card(
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(cat["icon"] as IconData, size: 40),
                    SizedBox(height: 10),
                    Text(
                      cat["title"] as String,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        )
      );
      
  }
}
 
