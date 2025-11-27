import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RendezVous extends StatefulWidget {
  const RendezVous({super.key});

  @override
  State<RendezVous> createState() => _RendezVousState();
}

class _RendezVousState extends State<RendezVous> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text('Mes Rendez-vous'),
  ),
  body: StreamBuilder(
    stream: FirebaseFirestore.instance.collection("RendezVous").orderBy('date',descending: false).snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshots) {
      if (snapshots.connectionState == ConnectionState.waiting){
        return CircularProgressIndicator();
      }
      if (!snapshots.hasData){
        return Text("Aucun Rendez-Vous");
      }
      List<dynamic>mesRdv = [];
      snapshots.data!.docs.forEach((element){
        mesRdv.add(element);
      });
      return ListView.builder(
    itemCount: mesRdv.length,
    itemBuilder: (context, index) {
      final rdv = mesRdv[index];
      final coiffeur = rdv['coiffeur'];
      final date = rdv['date'];
      final soin = rdv['soin'];
      final prix = rdv['prix'];
      final avatar = rdv['avatar'];

      return Card(
        child: ListTile(
          leading: Image.asset('assets/images/$avatar.jpg'),
          title: Text('$soin chez $coiffeur'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date : $date'),
              Text('Prix : $prix'),
            ],
          ),
          trailing: Icon(Icons.more_vert),
          isThreeLine: true,
        ),
      );
    },
  );
    } ,
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) {
          TextEditingController coiffeurCtrl = TextEditingController();
          TextEditingController dateCtrl = TextEditingController();
          TextEditingController soinCtrl = TextEditingController();
          TextEditingController prixCtrl = TextEditingController();

          return AlertDialog(
            title: Text("Nouveau rendez-vous"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: coiffeurCtrl,
                  decoration: InputDecoration(labelText: "Coiffeur(se)"),
                ),
                TextField(
                  controller: dateCtrl,
                  decoration: InputDecoration(labelText: "Date"),
                ),
                TextField(
                  controller: soinCtrl,
                  decoration: InputDecoration(labelText: "Soin"),
                ),
                TextField(
                  controller: prixCtrl,
                  decoration: InputDecoration(labelText: "Prix"),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Annuler"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    final rendezVousRef = FirebaseFirestore.instance.collection("RendezVous");
                    rendezVousRef.add({
                      "Coiffeur(se)": coiffeurCtrl.text,
                      "Date": dateCtrl.text,
                      "Soin": soinCtrl.text,
                      "Prix": prixCtrl.text,
                      "Avatar": "capilocksAvatar"
                    });
                  });
                  Navigator.pop(context);
                },
                child: Text("Ajouter"),
              )
            ],
          );
        },
      );
    },
    child: Icon(Icons.add),
  ),
);
  }
}