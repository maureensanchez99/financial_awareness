import 'package:flutter/material.dart';
import 'scholarships.dart';
import 'user_profile.dart';
import 'fafsa_overview.dart';
import 'calendar.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // knows what nav item currently on

  // list of pages that are in the nav bar
  final List<Widget> _pages = [
    const HomePageContent(),
    const UserProfile(),
    const FafsaOverview(),
    Scholarships(),
    const Calendar(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;      
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFF3C1053),
        selectedItemColor: const Color(0xFFA39AAC),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.savings),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Scholarships',
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context){
    return Center(
      child: ElevatedButton(
        onPressed: () {}, 
        child: const Text('Home Page content'),
      ),
    );
  }
}