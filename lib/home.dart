
import 'package:flutter/material.dart';
import 'package:shared_preference/welcome.dart';

import 'package:shared_preferences/shared_preferences.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  String _storedValue = "";
  String _storedValue1 = "";

  @override
  void initState() {
    super.initState();
    storevalue();
  }

  storevalue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedValue = prefs.getString('username') ?? 'DefaultUsername';
      _storedValue1 = prefs.getString('password') ?? 'Defaulpassword';
    });
  }

  saveValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username.text);
    prefs.setString('password', password.text);
    storevalue();

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(
          username: username.text,
          password: password.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Shared Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: username,
              decoration: const InputDecoration(labelText: 'Enter Username'),
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(labelText: 'Enter Password'),
              obscureText: true,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(height: 16.0),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                
                foregroundColor: Colors.blue,
              
                disabledForegroundColor: Colors.black,
              ),
              onPressed: saveValue,
              child: const Text('Login'),
            ),
            // const SizedBox(height: 16.0),
            // Text(' Username: $_storedValue'),
            // Text(' Password: $_storedValue1'),
          ],
        ),
      ),
    );
  }
}
