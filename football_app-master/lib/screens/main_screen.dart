import 'package:flutter/material.dart';
import 'package:football_app/constants.dart';
import 'package:football_app/news.dart';
import 'package:football_app/screens/home_screen.dart';
import 'package:iconsax/iconsax.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  List screens = [
    const HomeScreen(),
    const FootballNewsScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: kbackgroundColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.grey.shade200),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              title: "Home",
              icon: Iconsax.home,
              isActive: currentTab == 0,
              onTap: () {
                setState(() {
                  currentTab = 0;
                });
              },
            ),
            BottomNavItem(
              title: "Calender",
              icon: Iconsax.calendar_1,
              isActive: currentTab == 1,
              onTap: () {
                setState(() {
                  currentTab = 1;
                });
              },
            ),
            BottomNavItem(
              title: "Actualité",
              icon: Iconsax.chart,
              isActive: currentTab == 2,
              onTap: () {
                setState(() {
                  currentTab = 2;
                });
              },
            ),
            BottomNavItem(
              title: "Account",
              icon: Iconsax.profile_circle,
              isActive: currentTab == 3,
              onTap: () {
                setState(() {
                  currentTab = 3;
                });
              },
            ),
          ],
        ),
      ),
      body: screens[currentTab],
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function() onTap;
  final IconData icon;
  const BottomNavItem({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? kprimaryColor : kbackgroundColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.grey.shade400,
            ),
            isActive
                ? Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class Account {
  final String playerName;
  final int playerNumber;
  final String position;

  Account(this.playerName, this.playerNumber, this.position);
}

// Création d'une liste de comptes (joueurs de football)
List<Account> accounts = [
  Account('Lionel Messi', 10, 'Attaquant'),
  Account('Cristiano Ronaldo', 7, 'Attaquant'),
  Account('Neymar Jr', 10, 'Milieu'),
  // Ajoutez d'autres joueurs si nécessaire
];

// Création d'un widget pour afficher les informations du compte (joueur)
class AccountWidget extends StatelessWidget {
  final Account account;

  // ignore: prefer_const_constructors_in_immutables
  AccountWidget(this.account, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(account.playerName),
      subtitle: Text('N° ${account.playerNumber} - ${account.position}'),
    );
  }
}

// Création d'une page pour afficher les informations de tous les comptes (joueurs)
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Joueurs'),
      ),
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return AccountWidget(accounts[index]);
        },
      ),
    );
  }
}

// Point d'entrée de l'application
void main() {
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    title: 'Football App',
    home: const AccountPage(), // Affiche la page des comptes (joueurs)
  ));
}
