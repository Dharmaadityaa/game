import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;

  AnimalCard({required this.animal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(animal.image, width: 50, height: 50),
        title: Text(animal.name),
        onTap: () {
          Navigator.pushNamed(context, '/result');
        },
      ),
    );
  }
}
