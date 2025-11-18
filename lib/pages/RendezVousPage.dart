import 'package:flutter/material.dart';

class RendezVous extends StatefulWidget {
  const RendezVous({super.key});

  @override
  State<RendezVous> createState() => _RendezVousState();
}

class _RendezVousState extends State<RendezVous> {
  final mesRdv = [
    {
      "Coiffeur(se)" : "Capilocks",
      "Date" : "12/07/2025",
      "Soin" : "Décapage",
      "Prix": "120€",
      "Avatar":"capilocksAvatar"
    },
    {
      "Coiffeur(se)" : "Cindy",
      "Date" : "15/07/2025",
      "Soin" : "Retwist",
      "Prix": "30€",
      "Avatar":"cindyAvatar"
    },
    {
      "Coiffeur(se)" : "ZLocks",
      "Date" : "28/12/2025",
      "Soin" : "Reprise au crochet",
      "Prix": "90€",
      "Avatar":"ZLocksAvatar"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: mesRdv.length,
        itemBuilder: (context, index) {
          final rdv = mesRdv[index];
          final coiffeur = rdv['Coiffeur(se)'];
          final date = rdv['Date'];
          final soin = rdv['Soin'];
          final prix = rdv['Prix'];
          final avatar = rdv['Avatar'];

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
      ),
    );
}
}