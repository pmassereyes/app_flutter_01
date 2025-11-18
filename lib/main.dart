import 'package:app_flutter_01/pages/CategoriesPage.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_01/pages/HomePage.dart';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
setCurrentIndex(int index){
  setState((){
     _currentIndex = index;
  });
}
 
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MyLocks"),
        ),
        body: [
          HomePage(),
          Categories()
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index)=> setCurrentIndex(index),
          items: [
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil"
           ),
           BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Accueil"
           ),
        ]),
      )
    );
  }
}

  



 