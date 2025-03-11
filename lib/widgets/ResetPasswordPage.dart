// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:math';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({Key? key}) : super(key: key);

  final TextEditingController contactController = TextEditingController();

  // Fonction pour générer un mot de passe aléatoire de 5 chiffres
  String _generateTemporaryPassword() {
    final random = Random();
    return List.generate(5, (index) => random.nextInt(10)).join();
  }

  // Fonction pour vérifier si l'email ou le numéro de téléphone est valide
  bool _isValidContact(String contact) {
    // Vérifier si c'est un email valide (simple vérification)
    if (contact.contains('@')) {
      return true;
    }
    // Vérifier si c'est un numéro de téléphone valide (simple vérification)
    return contact.length == 10 && int.tryParse(contact) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mot de passe oublié'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Entrez votre email ou numéro de téléphone',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: contactController,
                  decoration: InputDecoration(
                    labelText: 'Email ou Numéro de téléphone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String contact = contactController.text;

                    // Vérification si le champ est vide
                    if (contact.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Veuillez entrer un email ou un numéro de téléphone.')),
                      );
                    } else if (!_isValidContact(contact)) {
                      // Vérification si l'email ou le numéro de téléphone n'est pas valide
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'L\'email ou le numéro de téléphone est invalide.')),
                      );
                    } else {
                      // Générer un mot de passe de récupération
                      String tempPassword = _generateTemporaryPassword();

                      // Afficher le mot de passe ou simuler l'envoi par email
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Votre mot de passe temporaire est : $tempPassword')),
                      );

                      // Vous pouvez ajouter ici l'envoi par email ou SMS via un service backend

                      // Rediriger l'utilisateur vers la page de connexion
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Envoyer le mot de passe',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
