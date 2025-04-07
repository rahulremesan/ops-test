import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2024 My Flutter Web App',
            style: TextStyle(color: Colors.white),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  // Navigate to About page
                },
                child: Text('About', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to Contact page
                },
                child: Text('Contact', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
