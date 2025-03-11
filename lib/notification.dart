// ignore_for_file: unused_import

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:football_app/constants.dart';

class NotificationPage extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications de différents clubs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            ButtonBar(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Affichage du contenu lorsque "See all" est pressé
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Contenu affiché pour "See all"'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(foregroundColor: kprimaryColor),
                  child: const Text("See all"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FlutterLocalNotificationsPlugin {}
