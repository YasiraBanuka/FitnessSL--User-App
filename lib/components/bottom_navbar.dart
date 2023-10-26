import 'package:fitnesssl/constants.dart';
import 'package:fitnesssl/pages/company/companies_page.dart';
import 'package:fitnesssl/pages/home/home_screen.dart';
import 'package:fitnesssl/pages/messenger/chat_home.dart';
import 'package:fitnesssl/pages/user/settings_page.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch (_selectedIndex) {
        case 0:
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
          break;
        case 2:
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CompaniesPage(),
            ),
          );
          break;
        case 3:
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChatHome(),
            ),
          );
          break;
        case 4:
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SettingsPage(),
            ),
          );
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: darkBlue,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, color: grey),
          activeIcon: Icon(Icons.home_filled, color: yellow),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined, color: grey),
          activeIcon: Icon(Icons.calendar_today, color: yellow),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics_outlined, color: grey),
          activeIcon: Icon(Icons.analytics_rounded, color: yellow),
          label: 'Analytics',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.forum_outlined, color: grey),
          activeIcon: Icon(Icons.forum_rounded, color: yellow),
          label: 'Messenger',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, color: grey),
          activeIcon: Icon(Icons.person, color: yellow),
          label: 'Profiles',
        ),
      ],
    );
  }
}
