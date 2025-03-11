// h2h_screen.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class H2HScreen extends StatelessWidget {
  const H2HScreen({Key? key}) : super(key: key);

  // Méthode privée pour construire une ligne de statistiques
  Widget _buildStatRow(String statTitle, String teamAValue, String teamBValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              teamAValue,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              statTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              teamBValue,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('H2H - 2ème Mi-Temps'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Statistiques 2ème Mi-Temps",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Affichage des images des équipes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    // Remplacez le chemin par celui de l'image de l'équipe A
                    Image.asset(
                      "assets/images/FCBarcelona.png",
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "BARCELONA FC",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    // Remplacez le chemin par celui de l'image de l'équipe B
                    Image.asset(
                      "assets/images/Bayern.png",
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "BAYERN MUNICH",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // En-tête de la table des statistiques
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Equipe A",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Stat",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Equipe B",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Divider(),
            // Lignes de statistiques
            _buildStatRow("Buts", "1", "2"),
            _buildStatRow("Tirs", "5", "3"),
            _buildStatRow("Tirs cadrés", "3", "2"),
            _buildStatRow("Possession", "55%", "45%"),
            _buildStatRow("Corners", "4", "1"),
            _buildStatRow("Fautes", "10", "8"),
            // Vous pouvez ajouter d'autres statistiques ici
          ],
        ),
      ),
    );
  }
}
