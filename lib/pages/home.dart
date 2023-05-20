import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
  children: const [
    ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/grandmother.png'),
      ),
      title: Text('Grandmother'),
      subtitle: Text('+65 9876 5432'),
      trailing: Icon(Icons.female_rounded),
    ),
    Divider(),
  ],
)
    );
  }
}