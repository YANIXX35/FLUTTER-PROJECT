// ignore_for_file: unused_import, avoid_print, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/constants.dart';
import 'package:football_app/widgets/live_match_box.dart';
import 'package:football_app/widgets/upcoming_match.dart';
import 'package:iconsax/iconsax.dart';
import 'package:football_app/screens/liga_screen.dart';
import 'package:football_app/screens/bundesliga_screen_.dart';
import 'package:football_app/screens/serie_a_screen_.dart';
import 'package:football_app/screens/tennis_screen.dart';
import 'package:football_app/screens/basket_screen.dart';

import 'basket_screen_.dart';
import 'serie_a_screen.dart';
import 'tennis_screen_.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
    "Chelsea vs Lester City: 3-1",
    "Marseille vs Dortmund: 1-1",
    "Liverpool vs Man United: À venir",
    "Tottenham vs Swansea: À venir"
  ];

  void _showSportsList() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          color: Colors.grey[200],
          child: ListView(
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/images/Basket.jpg',
                  width: 40,
                  height: 40,
                ),
                title: const Text('Basket'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BasketScreen()),
                  );
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/boxde.png',
                  width: 40,
                  height: 40,
                ),
                title: const Text('Boxe'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/teniss.png',
                  width: 40,
                  height: 40,
                ),
                title: const Text('Tennis'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TennisScreen()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _showSportsList,
          icon: const Icon(Iconsax.category),
        ),
        title: const Row(
          children: [
            Spacer(),
            Text(
              "S",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Icon(
              Icons.sports_soccer,
              color: kprimaryColor,
            ),
            Text(
              "ccer ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              "YANISSE",
              style: TextStyle(
                color: kprimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Spacer(),
          ],
        ),
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
        backgroundColor: Colors.blueAccent.withOpacity(0.9),
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 66, 66, 66),
                    ),
                  ),
                  const Spacer(),
                  DropdownButton<String>(
                    value: selectedLeague,
                    icon: const Icon(CupertinoIcons.chevron_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLeague = newValue!;
                      });
                      if (newValue == "La Liga") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LigaScreen(),
                          ),
                        );
                      } else if (newValue == "Bundesliga") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BundesligaScreen(),
                          ),
                        );
                      } else if (newValue == "Serie A") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SerieAScreen(),
                          ),
                        );
                      }
                    },
                    items:
                        leagues.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 243, 33, 33),
                          ),
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
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                children: const [
                  LiveMatchBox(
                    awayGoal: 1,
                    homeGoal: 90,
                    time: 83,
                    awayLogo: "assets/images/leicester_city.png",
                    homeLogo: "assets/images/chelsea.png",
                    awayTitle: "Lester City",
                    homeTitle: "Chelsea",
                    color: kboxColor,
                    textColors: Colors.white,
                    backgroundImage: DecorationImage(
                      image: AssetImage("assets/images/pl.png"),
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomLeft,
                      opacity: 0.3,
                    ), homeTeam: '',
                  ),
                  LiveMatchBox(
                    awayGoal: 4,
                    homeGoal: 64,
                    time: 12,
                    awayLogo: "assets/images/marseille.png",
                    homeLogo: "assets/images/dortmund.png",
                    awayTitle: "Marseille",
                    homeTitle: "Dortmund",
                    color: ksecondBoxColor,
                    textColors: Colors.black,
                    backgroundImage: DecorationImage(
                      image: AssetImage("assets/images/pl.png"),
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomLeft,
                      opacity: 0.1,
                    ), homeTeam: '',
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    "Up-Coming Matches",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: kprimaryColor,
                    ),
                    child: const Text("See all"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  UpComingMatch(
                    awayLogo: "assets/images/man_united.png",
                    awayTitle: "Man United",
                    homeLogo: "assets/images/liverpool.png",
                    homeTitle: "Liverpool FC",
                    date: "18 decembre",
                    time: "15:30",
                    isFavorite: true,
                  ),
                  UpComingMatch(
                    awayLogo: "assets/images/swansea.png",
                    awayTitle: "Swansea AFC",
                    homeLogo: "assets/images/tottenham.png",
                    homeTitle: "Tottenham",
                    date: "6 novembre",
                    time: "22:30",
                    isFavorite: false,
                  ),
                  UpComingMatch(
                    awayLogo: "assets/images/stoke.png",
                    awayTitle: "Stoke City",
                    homeLogo: "assets/images/arsenal.png",
                    homeTitle: "Arsenal",
                    date: "18 octobre",
                    time: "06:30",
                    isFavorite: false,
                  ),
                  UpComingMatch(
                    awayLogo: "assets/images/southampton.png",
                    awayTitle: "Southhampton",
                    homeLogo: "assets/images/sunderland.png",
                    homeTitle: "Sunderland",
                    date: "1 decembre",
                    time: "16:30",
                    isFavorite: false,
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
