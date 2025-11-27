import 'package:app_flutter_01/pages/BoutiquePage.dart';
import 'package:app_flutter_01/pages/RendezVousPage.dart';
import 'package:app_flutter_01/pages/SettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_01/pages/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  
  int _currentIndex = 0;
void setCurrentIndex(int index){
  setState((){
     _currentIndex = index;
  });
}
 
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
  leading: Builder(
    builder: (context) => IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Settings()),
        );
      },
    ),
  ),
  title: Text("MyLocks"),
),
        body: [
          HomePage(),
          Boutique(),
          RendezVous()
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
            label: "Boutique"
           ),
           BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Rendez-vous"
           ),
        ]),
      )
    );
  }
}

  



 