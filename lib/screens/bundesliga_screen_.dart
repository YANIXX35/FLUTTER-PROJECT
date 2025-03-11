import 'package:flutter/material.dart';

class BundesligaScreen extends StatelessWidget {
  const BundesligaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bundesliga'),
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
                  // Exemple : Bayern Munich vs Borussia Dortmund
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/Bayern.png",
                        width: 40,
                      ),
                      title: const Text("Bayern Munich vs Borussia Dortmund"),
                      subtitle: const Text("Résultat : 3 - 2"),
                      trailing: Image.asset(
                        "assets/images/dortmund.png",
                        width: 40,
                      ),
                    ),
                  ),
                  // Exemple : RB Leipzig vs Schalke 04
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/leipzig.png",
                        width: 40,
                      ),
                      title: const Text("RB Leipzig vs Schalke 04"),
                      subtitle: const Text("Résultat : 2 - 0"),
                      trailing: Image.asset(
                        "assets/images/shlake04.jpg",
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
                  // Exemple : Borussia Mönchengladbach vs Eintracht Frankfurt
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/borrusia.png",
                        width: 40,
                      ),
                      title: const Text(
                          "Borussia Mönchengladbach vs Eintracht Frankfurt"),
                      subtitle: const Text("Date : 15 avril, 18:30"),
                      trailing: Image.asset(
                        "assets/images/frankfurt.png",
                        width: 40,
                      ),
                    ),
                  ),
                  // Exemple : VfL Wolfsburg vs Werder Bremen
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/worlburg.png",
                        width: 40,
                      ),
                      title: const Text("VfL Wolfsburg vs Werder Bremen"),
                      subtitle: const Text("Date : 16 avril, 20:00"),
                      trailing: Image.asset(
                        "assets/images/werderm.jpg",
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
