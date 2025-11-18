import 'package:flutter/material.dart';
import 'package:app_flutter_01/pages/CategoriesPage.dart';
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://i.pinimg.com/736x/56/de/29/56de29a9b2efe945e190b28d99b33f24.jpg"),
            Text(
              "Bienvenue sur MyLocks !",
              style: TextStyle(
                fontSize: 42,
              ),
              textAlign: TextAlign.center,
              ),
              Text("La première application faite uniquement pour tes locks"),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_,_,_,) => Categories()
                  )
                  );
              }, 
              child: Text("Voir les catégories"))
          ],
        ),
      );
  }
}