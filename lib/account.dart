// ignore_for_file: unused_local_variable, prefer_final_fields, duplicate_ignore, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:football_app/login_page.dart';
// ignore: unused_import
import 'package:football_app/screens/main_screen.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  _AccountSettingsScreenState createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  // ignore: prefer_final_fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  // Méthode pour sauvegarder les coordonnées de l'utilisateur
  void _saveUserInfo() {
    String name = _nameController.text;
    String email = _emailController.text;
    // Vous pouvez implémenter ici la logique pour enregistrer les coordonnées de l'utilisateur
  }

  // Méthode pour gérer la déconnexion de l'utilisateur
  // ignore: unused_element
  void _logout() {
    // Ajoutez ici la logique de déconnexion, comme vider les données de l'utilisateur
    // ou naviguer vers l'écran de connexion, etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: prefer_const_constructors
            Text(
              'Name:',
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 20),
            // ignore: prefer_const_constructors
            Text(
              'Email:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: _saveUserInfo, // Appel de la méthode de sauvegarde
                child: const Text('Save'),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }, // Appel de la méthode de déconnexion
                child: const Text('Déconnexion'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AccountSettingsScreen(),
  ));
}
