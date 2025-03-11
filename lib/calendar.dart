import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CalendarScreen extends StatelessWidget {
  final List<Match> premierLeagueMatches = [
    Match(
      homeTeam: "chelsea",
      awayTeam: "leister city",
      date: "2024-05-12",
      homeTeamImage: 'assets/images/chelsea.png',
      awayTeamImage: 'assets/images/man.png',
    ),
    Match(
      homeTeam: "barcelona",
      awayTeam: "bayern",
      date: "2024-23-12",
      homeTeamImage: 'assets/images/FCBarcelona.png',
      awayTeamImage: 'assets/images/Bayern.png',
    ),
    Match(
      homeTeam: "southampton",
      awayTeam: "stoke city",
      date: "2024-11-12",
      homeTeamImage: 'assets/images/southampton.png',
      awayTeamImage: 'assets/images/stoke.png',
    ),
    Match(
      homeTeam: "inter milan",
      awayTeam: "juventus",
      date: "2024-05-12",
      homeTeamImage: 'assets/images/football.jpg',
      awayTeamImage: 'assets/images/télL.jpg',
    ),
    // Ajoutez d'autres matchs de la Premier League ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Champion league Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMatchesSection("Premier League", premierLeagueMatches),
            // Vous pouvez ajouter d'autres ligues ici si nécessaire
          ],
        ),
      ),
    );
  }

  Widget _buildMatchesSection(String title, List<Match> matches) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: matches.length,
          itemBuilder: (context, index) {
            final match = matches[index];
            return ListTile(
              leading: Image.asset(
                match.homeTeamImage,
                width: 100, // Taille moyenne
                height: 100, // Taille moyenne
              ),
              title: Expanded(
                child: Row(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(match.homeTeam),
                      ],
                    ),
                    const SizedBox(width: 10),
                    const Text('vs'),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        Text(match.awayTeam),
                        const SizedBox(width: 10),
                        Image.asset(
                          match.awayTeamImage,
                          width: 50, // Taille moyenne
                          height: 50, // Taille moyenne
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              subtitle: Text(match.date),
              onTap: () {
                // Action à effectuer lors du clic sur un match
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('${match.homeTeam} vs ${match.awayTeam}'),
                      content: Text('Date: ${match.date}'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class Match {
  final String homeTeam;
  final String awayTeam;
  final String date;
  final String homeTeamImage;
  final String awayTeamImage;

  Match({
    required this.homeTeam,
    required this.awayTeam,
    required this.date,
    required this.homeTeamImage,
    required this.awayTeamImage,
  });
}
