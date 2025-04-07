import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuPressed;

  const Header({Key? key, required this.onMenuPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('My Flutter Web App'),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: onMenuPressed,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Implement search functionality
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            // Navigate to settings page
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
