import 'package:flutter/material.dart';

class LigaScreen extends StatelessWidget {
  const LigaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("La Liga Matches"),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          MatchCard(
            homeTeam: "Real Madrid",
            awayTeam: "Barcelona",
            date: "10 Mars",
            time: "20:00",
          ),
          MatchCard(
            homeTeam: "Atletico Madrid",
            awayTeam: "Sevilla",
            date: "12 Mars",
            time: "18:00",
          ),
          MatchCard(
            homeTeam: "Valence",
            awayTeam: "Villareal",
            date: "14 Mars",
            time: "16:00",
          ),
        ],
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final String homeTeam;
  final String awayTeam;
  final String date;
  final String time;

  const MatchCard({
    super.key,
    required this.homeTeam,
    required this.awayTeam,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text("$homeTeam vs $awayTeam"),
        subtitle: Text("Date: $date - Heure: $time"),
        leading: const Icon(Icons.sports_soccer, color: Colors.red),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
