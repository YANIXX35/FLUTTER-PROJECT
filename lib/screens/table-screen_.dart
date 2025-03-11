// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Exemple de données : liste de 10 matchs avec le résultat final et les images des équipes
    final List<Map<String, String>> matchResults = [
      {
        'match': 'Chelsea vs Liverpool',
        'result': '3 - 2',
        'team1Image': 'assets/images/chelsea.png',
        'team2Image': 'assets/images/liverpool.png',
      },
      {
        'match': 'Marseille vs Dortmund',
        'result': '1 - 1',
        'team1Image': 'assets/images/marseille.png',
        'team2Image': 'assets/images/dortmund.png',
      },
      {
        'match': 'Man United vs Arsenal',
        'result': '2 - 0',
        'team1Image': 'assets/images/man_united.png',
        'team2Image': 'assets/images/arsenal.png',
      },
      {
        'match': 'Barcelona vs Real Madrid',
        'result': '2 - 3',
        'team1Image': 'assets/images/FCBarcelona.png',
        'team2Image': 'assets/images/real.jpg',
      },
      {
        'match': 'Juventus vs AC Milan',
        'result': '1 - 1',
        'team1Image': 'assets/images/juventus.png',
        'team2Image': 'assets/images/milan.jpg',
      },
      {
        'match': 'Bayern Munich vs Borussia Dortmund',
        'result': '3 - 2',
        'team1Image': 'assets/images/Bayern.png',
        'team2Image': 'assets/images/dortmund.png',
      },
      {
        'match': 'PSG vs Lyon',
        'result': '4 - 0',
        'team1Image': 'assets/images/psg.png',
        'team2Image': 'assets/images/FCBarcelona.png',
      },
      {
        'match': 'Inter Milan vs Napoli',
        'result': '2 - 2',
        'team1Image': 'assets/images/inter.jpg',
        'team2Image': 'assets/images/napoli.jpg',
      },
      {
        'match': 'Atletico Madrid vs Sevilla',
        'result': '1 - 0',
        'team1Image': 'assets/images/atleyico.png',
        'team2Image': 'assets/images/seville.png',
      },
      {
        'match': 'Everton vs Man City',
        'result': '0 - 3',
        'team1Image': 'assets/images/everton.png',
        'team2Image': 'assets/images/man.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Table - Résultats Finaux'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text(
                'Match',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Résultat Final',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: matchResults.map((data) {
            return DataRow(
              cells: [
                DataCell(
                  Row(
                    children: [
                      // Image de l'équipe 1
                      Image.asset(
                        data['team1Image']!,
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 8),
                      // Texte du match
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              data['match']!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Image de l'équipe 2
                      Image.asset(
                        data['team2Image']!,
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                ),
                DataCell(
                  Text(data['result']!),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
