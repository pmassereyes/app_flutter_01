import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Paramètres"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Réglages",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text("Mode Sombre"),
                trailing: Switch(value: false, onChanged: (v) {}),
              ),

              Divider(),

              ListTile(
                leading: Icon(Icons.info),
                title: Text("A propos"),
                onTap: () {},
              )
            ],
          )
        )
    );
  }
}