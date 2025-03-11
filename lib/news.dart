// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class FootballNewsScreen extends StatelessWidget {
  const FootballNewsScreen({Key? key}) : super(key: key);

  // Définir une liste statique de données d'actualités de football
  static const List<Map<String, String>> newsData = [
    {
      'title': 'Actualité 1',
      'image': 'assets/images/Bayern.png',
      'info': 'le bayern est en crise avec une dette impayer de 400 milliards',
    },
    {
      'title': 'Actualité 2',
      'image': 'assets/images/FCBarcelona.png',
      'info':
          'barcelona est le club le plus fort du monde,mais avec le depart de messi ,il sombre economiquement',
    },
    {
      'title': 'Actualité 3',
      'image': 'assets/images/chelsea.png',
      'info':
          'le chelsea de pothetino termine a la 6eme place du champoionnat anglais et jouera la ligue europa la saison prochaine',
    },
    {
      'title': 'Actualité 4',
      'image': 'assets/images/leicester_city.png',
      'info':
          'leister city retrouve la premier league, 1 ans sa descente en championship',
    },
    {
      'title': 'Actualité 5',
      'image': 'assets/images/monaco.pngg',
      'info': 'monaco retrouve la C1',
    },
    {
      'title': 'Actualité 6',
      'image': 'assets/images/psg.png',
      'info': ' PSG veut vendre leur meilleur butteur Mbappe au real',
    },
    {
      'title': 'Actualité 7',
      'image': 'assets/images/dortmund.png',
      'info': 'le BVB toujours en europa league',
    },
    {
      'title': 'Actualité 8',
      'image': 'assets/images/marseille.png',
      'info': 'marseille en LDC la saison prochaine',
    },

    // Ajoutez autant d'éléments que nécessaire
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football News'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/football_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: newsData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(newsData[index]['title']!),
                  Text(newsData[index]['info']!),
                ],
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage(newsData[index]['image']!),
              ),
            );
          },
        ),
      ),
    );
  }
}
