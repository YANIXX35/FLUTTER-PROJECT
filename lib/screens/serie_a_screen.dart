import 'package:flutter/material.dart';

class SerieAScreen extends StatelessWidget {
  const SerieAScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serie A'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section : Matchs Déjà Joués
              const Text(
                "Matchs Déjà Joués",
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
                  // Exemple : Juventus vs Inter Milan
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/juventus.png",
                        width: 40,
                      ),
                      title: const Text("Juventus vs Inter Milan"),
                      subtitle: const Text("Résultat : 2 - 1"),
                      trailing: Image.asset(
                        "assets/images/inter.jpg",
                        width: 40,
                      ),
                    ),
                  ),
                  // Exemple : AC Milan vs AS Roma
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/milan.jpg",
                        width: 40,
                      ),
                      title: const Text("AC Milan vs AS Roma"),
                      subtitle: const Text("Résultat : 1 - 1"),
                      trailing: Image.asset(
                        "assets/images/roma.png",
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Section : Matchs à Venir
              const Text(
                "Matchs à Venir",
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
                  // Exemple : Napoli vs Lazio
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/napoli.jpg",
                        width: 40,
                      ),
                      title: const Text("Napoli vs Lazio"),
                      subtitle: const Text("Date : 20 avril, 18:00"),
                      trailing: Image.asset(
                        "assets/images/lazio.jpg",
                        width: 40,
                      ),
                    ),
                  ),
                  // Exemple : Fiorentina vs Torino
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/fiorentina.jpg",
                        width: 40,
                      ),
                      title: const Text("Fiorentina vs Torino"),
                      subtitle: const Text("Date : 22 avril, 20:00"),
                      trailing: Image.asset(
                        "assets/images/torino.jpg",
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
