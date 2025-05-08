import 'package:flutter/material.dart';
import '../models/animal.dart';
import '../widgets/animal_card.dart';

class GameScreen extends StatelessWidget {
  final List<Animal> animals = [
    Animal(name: 'Kucing', image: 'assets/images/kucing.png'),
    Animal(name: 'Anjing', image: 'assets/images/anjing.png'),
    Animal(name: 'Gajah', image: 'assets/images/gajah.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tebak Hewan')),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          return AnimalCard(animal: animals[index]);
        },
      ),
    );
  }
}
