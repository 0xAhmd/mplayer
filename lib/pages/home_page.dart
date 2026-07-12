import 'package:flutter/material.dart';
import 'package:mplayer/components/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('P L A Y L I S T S' , style: TextStyle(fontSize: 20)),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}