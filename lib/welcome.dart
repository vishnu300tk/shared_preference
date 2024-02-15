
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String username;
  final String password;

  const SecondPage({super.key, required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: $username',style: const TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
            Text('Password: $password',style: const TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
