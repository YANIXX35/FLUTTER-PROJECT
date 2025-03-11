// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<Map<String, String>> usersHistory;

  HistoryPage({required this.usersHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historique des inscriptions"),
        backgroundColor: Colors.blue,
      ),
      body: usersHistory.isEmpty
          ? const Center(child: Text("Aucun utilisateur inscrit"))
          : ListView.builder(
              itemCount: usersHistory.length,
              itemBuilder: (context, index) {
                final user = usersHistory[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    title: Text('${user['firstName']} ${user['lastName']}'),
                    subtitle: Text('${user['email']}'),
                    trailing: Text('${user['dateTime']}'),
                  ),
                );
              },
            ),
    );
  }
}
