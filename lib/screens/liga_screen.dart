import 'package:flutter/material.dart';

class LigaScreen extends StatelessWidget {
  const LigaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La Liga'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section des matchs déjà joués
              const Text(
                "Matchs déjà joués",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Match : Real Madrid vs Barcelona
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/real.jpg",
                        width: 40,
                      ),
                      title: const Text("Real Madrid vs Barcelona"),
                      subtitle: const Text("Résultat : 2 - 1"),
                      trailing: Image.asset(
                        "assets/images/FCBarcelona.png",
                        width: 40,
                      ),
                    ),
                  ),
                  // Match : Atlético Madrid vs Sevilla
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/atleyico.png",
                        width: 40,
                      ),
                      title: const Text("Atlético Madrid vs Sevilla"),
                      subtitle: const Text("Résultat : 1 - 0"),
                      trailing: Image.asset(
                        "assets/images/seville.png",
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Section des matchs à venir
              const Text(
                "Matchs à venir",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Match : Valence vs Villarreal
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/valence.png",
                        width: 40,
                      ),
                      title: const Text("Valence vs Villarreal"),
                      subtitle: const Text("Date : 25 décembre, 18:00"),
                      trailing: Image.asset(
                        "assets/images/villareal.png",
                        width: 40,
                      ),
                    ),
                  ),
                  // Match : Levante vs Real Sociedad
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/levante.png",
                        width: 40,
                      ),
                      title: const Text("Levante vs Real Sociedad"),
                      subtitle: const Text("Date : 27 décembre, 20:00"),
                      trailing: Image.asset(
                        "assets/images/realsociedad.png",
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
