import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:fitnesssl/pages/messenger/chat_home.dart';

class bottomNavigationBar extends StatelessWidget {
  const bottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Ionicons.home_outline, color: Color(0xFF526480)),
          activeIcon: Icon(Ionicons.home_outline, color: Color(0xFF526480)),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.location_outline),
          label: "Map",
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.bookmark_outline),
          label: "Bookmark",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Ionicons.chatbubble_ellipses_outline,
            color: Color(0xFF526480),
          ),
          activeIcon: Icon(
            Ionicons.chatbox_ellipses,
            color: Color(0xFF008FA0),
          ), // Correct icon name
          label: "Messenger",
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.person_outline),
          label: "Profile",
        ),
      ],
      onTap: (int index) {
        // Check if the "Messenger" item is tapped (index 3) and navigate to the MessengerPage
        if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatHome()),
          );
        }
      },
    );
  }
}
