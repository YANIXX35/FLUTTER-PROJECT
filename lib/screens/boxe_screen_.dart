// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class BoxeScreen extends StatefulWidget {
  @override
  _BoxeScreenState createState() => _BoxeScreenState();
}

class _BoxeScreenState extends State<BoxeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    BoxeHomePage(),
    BoxeCalendarPage(),
    BoxeNewsPage(), // Remplace Stats par Actualités
    BoxeProfilePage(),
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
            icon: Icon(Icons.sports_mma),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendrier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Actualités',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

// 🏠 Home Page - Combats en direct
class BoxeHomePage extends StatelessWidget {
  final List<Map<String, String>> liveMatches = [
    {
      'fighter1': 'Tyson Fury',
      'fighter2': 'Deontay Wilder',
      'round': 'Round 8',
      'image1': 'assets/images/fury.png',
      'image2': 'assets/images/wilder.png'
    },
    {
      'fighter1': 'Canelo Alvarez',
      'fighter2': 'Gennady Golovkin',
      'round': 'Round 6',
      'image1': 'assets/images/canelo.png',
      'image2': 'assets/images/ggg.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: liveMatches.map((fight) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(fight['image1']!),
            title: Text('${fight['fighter1']} vs ${fight['fighter2']}'),
            subtitle: Text('Statut: ${fight['round']}'),
            trailing: Image.asset(fight['image2']!),
          ),
        );
      }).toList(),
    );
  }
}

// 📅 Calendrier - Combats à venir
class BoxeCalendarPage extends StatelessWidget {
  final List<Map<String, String>> upcomingFights = [
    {
      'fighter1': 'Floyd Mayweather',
      'fighter2': 'Manny Pacquiao',
      'date': '20 Mars 2025',
      'image1': 'assets/images/mayweather.png',
      'image2': 'assets/images/pacquiao.png'
    },
    {
      'fighter1': 'Jake Paul',
      'fighter2': 'Tommy Fury',
      'date': '25 Mars 2025',
      'image1': 'assets/images/jake.png',
      'image2': 'assets/images/tommy.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: upcomingFights.map((fight) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(fight['image1']!),
            title: Text('${fight['fighter1']} vs ${fight['fighter2']}'),
            subtitle: Text('Date: ${fight['date']}'),
            trailing: Image.asset(fight['image2']!),
          ),
        );
      }).toList(),
    );
  }
}

// 📰 Actualités - Dernières infos sur la boxe
class BoxeNewsPage extends StatelessWidget {
  final List<Map<String, String>> news = [
    {
      'title': 'Tyson Fury prêt pour son prochain combat',
      'description':
          'Tyson Fury annonce qu’il est prêt à affronter n’importe quel adversaire pour défendre son titre mondial.',
      'image': 'assets/images/news_fury.png'
    },
    {
      'title': 'Canelo Alvarez veut unifier les titres',
      'description':
          'Le champion mexicain vise une unification complète des ceintures dans sa catégorie.',
      'image': 'assets/images/news_canelo.png'
    },
    {
      'title': 'Jake Paul continue son ascension en boxe',
      'description':
          'Après plusieurs victoires, Jake Paul affirme qu’il veut affronter un top 10 mondial.',
      'image': 'assets/images/news_jake.png'
    },
    {
      'title': 'Gervonta Davis impressionne encore',
      'description':
          'Gervonta Davis a livré une performance impressionnante lors de son dernier combat.',
      'image': 'assets/images/news_davis.png'
    },
    {
      'title': 'Retour de Manny Pacquiao sur le ring ?',
      'description':
          'Des rumeurs circulent sur un possible retour du légendaire Pacquiao.',
      'image': 'assets/images/news_pacquiao.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: news.map((article) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(article['image']!, width: 50, height: 50),
            title: Text(article['title']!),
            subtitle: Text(article['description']!),
          ),
        );
      }).toList(),
    );
  }
}

// 👤 Profil - Informations utilisateur
class BoxeProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          SizedBox(height: 10),
          Text('Utilisateur : Mohamed Ali', style: TextStyle(fontSize: 20)),
          Text('Email : ali.legend@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}
