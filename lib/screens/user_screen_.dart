// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController team1Controller = TextEditingController();
  final TextEditingController team2Controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<String> predictionHistory = [];

  String predictionResult = "";
  int confidenceScore = 0;

  void generatePrediction() {
    if (team1Controller.text.isEmpty || team2Controller.text.isEmpty) {
      setState(() {
        predictionResult = "Veuillez entrer deux équipes.";
        confidenceScore = 0;
      });
      return;
    }

    List<String> possibleResults = [
      "${team1Controller.text} gagne",
      "${team2Controller.text} gagne",
      "Match nul"
    ];

    predictionResult = (possibleResults..shuffle()).first;
    confidenceScore =
        (50 + (confidenceScore + 1) % 51); // Score entre 50 et 100%

    setState(() {
      String newPrediction =
          "⚽ ${team1Controller.text} vs ${team2Controller.text} → $predictionResult (Confiance: $confidenceScore%)";

      predictionHistory.add(newPrediction);
    });

    // Scroller vers le bas après chaque nouvelle prédiction
    Future.delayed(Duration(milliseconds: 300), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Prédictions de Match",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent.withOpacity(0.9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "📊 Entrez les équipes pour obtenir une prédiction :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              _buildTextField(team1Controller, "Équipe 1"),
              const SizedBox(height: 10),
              _buildTextField(team2Controller, "Équipe 2"),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: generatePrediction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text("🔮 Prédire le match"),
              ),
              const SizedBox(height: 20),
              if (predictionResult.isNotEmpty) _buildPredictionCard(),
              const SizedBox(height: 20),
              const Text(
                "📜 Historique des prédictions :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: predictionHistory.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.history, color: Colors.blueAccent),
                      title: Text(predictionHistory[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: const Icon(Iconsax.ram),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
    );
  }

  Widget _buildPredictionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "🔮 Prédiction : $predictionResult",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "📊 Score de confiance : $confidenceScore%",
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
