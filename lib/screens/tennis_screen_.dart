// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TennisScreen extends StatelessWidget {
  // Liste des matchs en direct
  final List<Map<String, String>> liveMatches = [
    {
      'player1': 'Novak Djokovic',
      'player2': 'Rafael Nadal',
      'score': '6-4, 3-6, 7-5',
      'status': 'En cours'
    },
    {
      'player1': 'Roger Federer',
      'player2': 'Andy Murray',
      'score': '6-3, 4-6, 2-1',
      'status': 'En cours'
    },
    {
      'player1': 'Dominic Thiem',
      'player2': 'Alexander Zverev',
      'score': '6-2, 4-6, 6-3',
      'status': 'En cours'
    },
    {
      'player1': 'Stefanos Tsitsipas',
      'player2': 'Daniil Medvedev',
      'score': '6-4, 7-6',
      'status': 'En cours'
    },
    {
      'player1': 'Alexander Zverev',
      'player2': 'John Isner',
      'score': '6-3, 6-4',
      'status': 'En cours'
    },
    {
      'player1': 'Matteo Berrettini',
      'player2': 'Felix Auger-Aliassime',
      'score': '7-5, 6-3',
      'status': 'En cours'
    },
    {
      'player1': 'Carlos Alcaraz',
      'player2': 'Casper Ruud',
      'score': '6-4, 6-4',
      'status': 'En cours'
    },
    {
      'player1': 'Andrey Rublev',
      'player2': 'Hubert Hurkacz',
      'score': '6-2, 6-7, 6-4',
      'status': 'En cours'
    },
    {
      'player1': 'Jannik Sinner',
      'player2': 'Lorenzo Musetti',
      'score': '7-6, 3-6, 6-3',
      'status': 'En cours'
    },
    {
      'player1': 'Grigor Dimitrov',
      'player2': 'Marin Cilic',
      'score': '6-4, 7-5',
      'status': 'En cours'
    },
  ];

  // Liste des matchs à venir
  final List<Map<String, String>> upcomingMatches = [
    {
      'player1': 'Dominic Thiem',
      'player2': 'Alexander Zverev',
      'date': '12 Mars 2025',
      'time': '14:00'
    },
    {
      'player1': 'Stefanos Tsitsipas',
      'player2': 'Daniil Medvedev',
      'date': '13 Mars 2025',
      'time': '16:00'
    },
    {
      'player1': 'Roger Federer',
      'player2': 'Rafael Nadal',
      'date': '15 Mars 2025',
      'time': '18:00'
    },
    {
      'player1': 'Novak Djokovic',
      'player2': 'Andy Murray',
      'date': '16 Mars 2025',
      'time': '20:00'
    },
    {
      'player1': 'Alexander Zverev',
      'player2': 'Carlos Alcaraz',
      'date': '18 Mars 2025',
      'time': '14:00'
    },
    {
      'player1': 'Jannik Sinner',
      'player2': 'Matteo Berrettini',
      'date': '19 Mars 2025',
      'time': '15:00'
    },
    {
      'player1': 'John Isner',
      'player2': 'Felix Auger-Aliassime',
      'date': '20 Mars 2025',
      'time': '16:30'
    },
    {
      'player1': 'Andrey Rublev',
      'player2': 'Hubert Hurkacz',
      'date': '22 Mars 2025',
      'time': '18:00'
    },
    {
      'player1': 'Grigor Dimitrov',
      'player2': 'Marin Cilic',
      'date': '24 Mars 2025',
      'time': '20:00'
    },
    {
      'player1': 'Lorenzo Musetti',
      'player2': 'Casper Ruud',
      'date': '25 Mars 2025',
      'time': '19:00'
    },
  ];

  // Liste des joueurs et leurs clubs
  final List<Map<String, String>> playersAndClubs = [
    {
      'player': 'Novak Djokovic',
      'club': 'Red Star Belgrade',
      'image': 'assets/images/djokovic.jpg'
    },
    {
      'player': 'Rafael Nadal',
      'club': 'Real Club de Tennis Barcelona',
      'image': 'assets/images/rafael.jpg'
    },
    {
      'player': 'Roger Federer',
      'club': 'Tennis Club de Bâle',
      'image': 'assets/images/rogerfederer.jpg'
    },
    {
      'player': 'Andy Murray',
      'club': 'Dunblane Sports Club',
      'image': 'assets/images/andy.jpg '
    },
    {
      'player': 'Carlos Alcaraz',
      'club': 'Club de Tenis de Valencia',
      'image': 'assets/images/carloss.jpg'
    },
    {
      'player': 'Alexander Zverev',
      'club': 'Tennis Club de Hambourg',
      'image': 'assets/images/zrevev.jpg'
    },
    {
      'player': 'Stefanos Tsitsipas',
      'club': 'Athens Tennis Club',
      'image': 'assets/images/zpizpas.jpg'
    },
    {
      'player': 'Daniil Medvedev',
      'club': 'Moscow Tennis Club',
      'image': 'assets/images/dannill.jpg'
    },
    {
      'player': 'Matteo Berrettini',
      'club': 'Tennis Club Roma',
      'image': 'assets/images/matteo.jpg'
    },
    {
      'player': 'Felix Auger-Aliassime',
      'club': 'Club Avantage Montréal',
      'image': 'assets/images/felixx.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tennis'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section des catégories à afficher en bas
              const SizedBox(height: 20),
              ExpansionTile(
                title: const Text(
                  'Matchs en Direct',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                children: liveMatches.map((match) {
                  return ListTile(
                    title: Text('${match['player1']} vs ${match['player2']}'),
                    subtitle: Text('Score: ${match['score']}'),
                    trailing: Text(match['status']!),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ExpansionTile(
                title: const Text(
                  'Matchs à Venir',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                children: upcomingMatches.map((match) {
                  return ListTile(
                    title: Text('${match['player1']} vs ${match['player2']}'),
                    subtitle: Text('Date: ${match['date']} à ${match['time']}'),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ExpansionTile(
                title: const Text(
                  'Joueurs et Clubs',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                children: playersAndClubs.map((player) {
                  return ListTile(
                    leading: Image.asset(
                      player['image']!,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    title: Text(player['player']!),
                    subtitle: Text('Club: ${player['club']}'),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
