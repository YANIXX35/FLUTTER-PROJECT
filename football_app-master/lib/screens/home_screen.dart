// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/constants.dart';
import 'package:football_app/widgets/live_match_box.dart';
import 'package:football_app/widgets/upcoming_match.dart';
import 'package:iconsax/iconsax.dart';
import 'liga_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedLeague = "Premier League";
  final List<String> leagues = [
    "Premier League",
    "La Liga",
    "Serie A",
    "Bundesliga"
  ];

  List<String> notifications = [
    "Chelsea vs Leicester City: 3-1",
    "Marseille vs Dortmund: 1-1",
    "Liverpool vs Man United: À venir",
    "Tottenham vs Swansea: À "
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Soccer kouassi "),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return notifications
                  .map<PopupMenuItem<String>>((String notification) {
                return PopupMenuItem<String>(
                  value: notification,
                  child: Text(notification),
                );
              }).toList();
            },
            icon: const Icon(Iconsax.notification),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Text(
                    "Live Match",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  DropdownButton<String>(
                    value: selectedLeague,
                    icon: const Icon(CupertinoIcons.chevron_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLeague = newValue!;
                        if (selectedLeague == "La Liga") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LigaScreen()),
                          );
                        }
                      });
                    },
                    items:
                        leagues.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView(
                padding: const EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                children: const [
                  LiveMatchBox(
                    awayGoal: 1,
                    homeGoal: 23,
                    time: 83,
                    awayLogo: "assets/images/leicester_city.png",
                    homeLogo: "assets/images/chelsea.png",
                    awayTitle: "Leicester City",
                    homeTitle: "Chelsea",
                    color: kboxColor,
                    textColors: Colors.white,
                    backgroundImage: DecorationImage(
                      // Image de fond ajoutée ici
                      image: AssetImage("assets/images/pl.png"),
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomLeft,
                      opacity: 0.3,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Text(
                    "Up-Coming Matches",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See all"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
