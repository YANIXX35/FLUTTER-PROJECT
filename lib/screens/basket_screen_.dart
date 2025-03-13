// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class BasketScreen extends StatefulWidget {
  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CalendarPage(),
    StatsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendrier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

// 🏠 Home Page - Matchs en direct
class HomePage extends StatelessWidget {
  final List<Map<String, String>> liveMatches = [
    {
      'team1': 'Los Angeles Lakers',
      'team2': 'Boston Celtics',
      'score': '102-99',
      'image1': 'assets/images/lakers.png',
      'image2': 'assets/images/boston.png'
    },
    {
      'team1': 'Chicago Bulls',
      'team2': 'Miami Heat',
      'score': '89-95',
      'image1': 'assets/images/chicago.png',
      'image2': 'assets/images/miamih.png'
    },
    {
      'team1': 'Phoenix Suns',
      'team2': 'San Antonio Spurs',
      'score': '110-103',
      'image1': 'assets/images/phoenix.png',
      'image2': 'assets/images/antonio.png'
    },
    {
      'team1': 'Denver Nuggets',
      'team2': 'New York Knicks',
      'score': '98-105',
      'image1': 'assets/images/denver.png',
      'image2': 'assets/images/newyork.png'
    },
    {
      'team1': 'Philadelphia 76ers',
      'team2': 'Houston Rockets',
      'score': '120-115',
      'image1': 'assets/images/philadelphia.png',
      'image2': 'assets/images/houston.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: liveMatches.map((match) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(match['image1']!),
            title: Text('${match['team1']} vs ${match['team2']}'),
            subtitle: Text('Score: ${match['score']}'),
            trailing: Image.asset(match['image2']!),
          ),
        );
      }).toList(),
    );
  }
}

// 📅 Calendrier - Prochains matchs
class CalendarPage extends StatelessWidget {
  final List<Map<String, String>> upcomingMatches = [
    {
      'team1': 'Golden State Warriors',
      'team2': 'Brooklyn Nets',
      'date': '12 Mars 2025',
      'image1': 'assets/images/golden.png',
      'image2': 'assets/images/brookyln.jpg'
    },
    {
      'team1': 'Toronto Raptors',
      'team2': 'Dallas Mavericks',
      'date': '14 Mars 2025',
      'image1': 'assets/images/toronnto.jpg',
      'image2': 'assets/images/dallas.jpg'
    },
    {
      'team1': 'Memphis Grizzlies',
      'team2': 'Orlando Magic',
      'date': '16 Mars 2025',
      'image1': 'assets/images/memphis.png',
      'image2': 'assets/images/orlando.png'
    },
    {
      'team1': 'Atlanta Hawks',
      'team2': 'Portland Trail Blazers',
      'date': '18 Mars 2025',
      'image1': 'assets/images/atlantahawk.png',
      'image2': 'assets/images/portland.png'
    },
    {
      'team1': 'Sacramento Kings',
      'team2': 'Charlotte Hornets',
      'date': '20 Mars 2025',
      'image1': 'assets/images/sacraento.jpeg',
      'image2': 'assets/images/charlotte.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: upcomingMatches.map((match) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(match['image1']!),
            title: Text('${match['team1']} vs ${match['team2']}'),
            subtitle: Text('Date: ${match['date']}'),
            trailing: Image.asset(match['image2']!),
          ),
        );
      }).toList(),
    );
  }
}

// 📊 Stats - Classement des équipes
class StatsPage extends StatelessWidget {
  final List<Map<String, String>> rankings = [
    {
      'team': 'Los Angeles Lakers',
      'points': '55',
      'image': 'assets/images/lakers.png'
    },
    {
      'team': 'Boston Celtics',
      'points': '53',
      'image': 'assets/images/boston.png'
    },
    {'team': 'Miami Heat', 'points': '50', 'image': 'assets/images/miamih.png'},
    {
      'team': 'Golden State Warriors',
      'points': '48',
      'image': 'assets/images/golden.png'
    },
    {
      'team': 'Denver Nuggets',
      'points': '46',
      'image': 'assets/images/denver.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: rankings.map((team) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(team['image']!),
            title: Text(team['team']!),
            subtitle: Text('Points: ${team['points']}'),
          ),
        );
      }).toList(),
    );
  }
}

// 👤 Profil - Informations utilisateur
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/kodjo.jpg'),
          ),
          SizedBox(height: 10),
          Text('Utilisateur : John Doe', style: TextStyle(fontSize: 20)),
          Text('Email : KodjoRenezzzzz@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}
