import 'package:flutter/material.dart';

import '../../../DataModels/UsersModel.dart';

class DetailsScreen extends StatelessWidget {
  final UserModel user;

  const DetailsScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person, size: 80, color: Colors.blueGrey),
                SizedBox(height: 20),
                Text("Email: ${user.email}", style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Text("Phone: ${user.phone}", style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
