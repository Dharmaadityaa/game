import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(GuessAnimalApp());
}

class GuessAnimalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guess Animal',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/game': (context) => GameScreen(stage: 1),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[100]!, Colors.blue[50]!],
          ),
        ),
        child: Stack(
          children: [
            // Background elements
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Text(
                      'Guess Animal',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Colorful dots border
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Container(
                height: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    30,
                    (index) => Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: [
                          Colors.yellow,
                          Colors.pink,
                          Colors.green,
                          Colors.blue,
                          Colors.orange,
                        ][index % 5],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Main content - matched to screenshot
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back button
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 15,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),

                        // Main content
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Elephant image - sized to match screenshots
                                Image.asset(
                                  'assets/images/gajah.png',
                                  height: 130,
                                ),

                                // Dialog bubble - styled to match screenshot
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: 40, right: 40),
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    'Hai... nama aku Udin, aku akan ajak kamu mengenal hewan!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Button container with navigation - matched to screenshot
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/game');
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFD3FFB5),
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset(
                                    'assets/images/udin_icon.png',
                                    errorBuilder: (ctx, err, _) =>
                                        Icon(Icons.person),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.purple[100],
                                    child: Text(
                                      'AYO KENALI HEWAN...',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Animal Model to store animal data
class Animal {
  final String name;
  final String imageAsset;

  Animal({required this.name, required this.imageAsset});
}

class GameScreen extends StatefulWidget {
  final int stage;

  const GameScreen({Key? key, required this.stage}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<Animal> animals;
  late Animal correctAnimal;
  late int stageNumber;

  @override
  void initState() {
    super.initState();
    stageNumber = widget.stage;

    // Define all available animals
    final allAnimals = [
      Animal(name: 'gajah', imageAsset: 'assets/images/gajah.png'),
      Animal(name: 'monyet', imageAsset: 'assets/images/monyet.png'),
      Animal(name: 'anjing', imageAsset: 'assets/images/anjing.png'),
      Animal(name: 'jerapah', imageAsset: 'assets/images/jerapah.png'),
      Animal(name: 'panda', imageAsset: 'assets/images/panda.png'),
      // You can add more animals here
    ];

    // For stage 1, use the original setup with gajah as the correct answer
    if (stageNumber == 1) {
      animals = allAnimals;
      correctAnimal = animals.firstWhere((animal) => animal.name == 'gajah');
    }
    // For other stages, select random animals and a random correct answer
    else {
      // Shuffle the animals list
      final shuffledAnimals = List<Animal>.from(allAnimals)..shuffle();

      // Take the first 5 (or less if we don't have enough)
      animals = shuffledAnimals.take(5).toList();

      // Select a random animal as the correct one
      correctAnimal = animals[Random().nextInt(animals.length)];
    }
  }

  void checkAnswer(BuildContext context, String selectedAnimal) {
    bool isCorrect = selectedAnimal == correctAnimal.name;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          isCorrect: isCorrect,
          animals: animals,
          correctAnimal: correctAnimal,
          stage: stageNumber,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[100]!, Colors.blue[50]!],
          ),
        ),
        child: Stack(
          children: [
            // Background elements
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Text(
                      'Guess Animal ${stageNumber}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Colorful dots border
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Container(
                height: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    30,
                    (index) => Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: [
                          Colors.yellow,
                          Colors.pink,
                          Colors.green,
                          Colors.blue,
                          Colors.orange,
                        ][index % 5],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Main content - matched to screenshot
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back button
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 15,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),

                        // Main content
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Animal selection area - dynamically arranged based on the number of animals
                              if (animals.length <= 3)
                                _buildAnimalRow(animals)
                              else ...[
                                _buildAnimalRow(animals.sublist(0, 3)),
                                SizedBox(height: 20),
                                _buildAnimalRow(animals.sublist(3)),
                              ],
                            ],
                          ),
                        ),

                        // Button container - matched to screenshot
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFD3FFB5),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black),
                                  ),
                                ),
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  'assets/images/udin_icon.png',
                                  errorBuilder: (ctx, err, _) =>
                                      Icon(Icons.person),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.purple[100],
                                  child: Text(
                                    'BANTU SI UDIN MENEMUKAN ${correctAnimal.name.toUpperCase()}...',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalRow(List<Animal> rowAnimals) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: rowAnimals.map((animal) {
        return GestureDetector(
          onTap: () => checkAnswer(context, animal.name),
          child: Image.asset(
            animal.imageAsset,
            height: 70,
            width: 70,
          ),
        );
      }).toList(),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final bool isCorrect;
  final List<Animal> animals;
  final Animal correctAnimal;
  final int stage;

  const ResultScreen({
    Key? key,
    required this.isCorrect,
    required this.animals,
    required this.correctAnimal,
    required this.stage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[100]!, Colors.blue[50]!],
          ),
        ),
        child: Stack(
          children: [
            // Background elements
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Text(
                      'Guess Animal ${stage}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Colorful dots border
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Container(
                height: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    30,
                    (index) => Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: [
                          Colors.yellow,
                          Colors.pink,
                          Colors.green,
                          Colors.blue,
                          Colors.orange,
                        ][index % 5],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Main content - matched to screenshot
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back button
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 15,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),

                        // Main content
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Display animals dynamically
                              if (animals.length <= 3)
                                _buildAnimalRow(animals)
                              else ...[
                                _buildAnimalRow(animals.sublist(0, 3)),
                                SizedBox(height: 20),
                                _buildAnimalRow(animals.sublist(3)),
                              ],

                              SizedBox(height: 20),

                              // Correct animal indicator
                              if (!isCorrect)
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red[50],
                                  ),
                                  child: Text(
                                    'Yang benar adalah ${correctAnimal.name}',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),

                        // Button container - matched to screenshot
                        Row(
                          children: [
                            // Go to home button
                            if (isCorrect)
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigate to next stage
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            GameScreen(stage: stage + 1),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD3FFB5),
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          padding: EdgeInsets.all(5),
                                          child: Image.asset(
                                            'assets/images/udin_icon.png',
                                            errorBuilder: (ctx, err, _) =>
                                                Icon(Icons.person),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            color: Colors.green[100],
                                            child: Text(
                                              'LANJUT KE STAGE ${stage + 1}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            // Small gap if we have both buttons
                            if (isCorrect) SizedBox(width: 8),

                            // Try again or Home button
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  if (isCorrect) {
                                    // Go home if correct
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/home',
                                      (route) => false,
                                    );
                                  } else {
                                    // Try again if wrong
                                    Navigator.pop(context);
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD3FFB5),
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right:
                                                BorderSide(color: Colors.black),
                                          ),
                                        ),
                                        padding: EdgeInsets.all(5),
                                        child: Image.asset(
                                          'assets/images/udin_icon.png',
                                          errorBuilder: (ctx, err, _) =>
                                              Icon(Icons.person),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: isCorrect
                                              ? Colors.pink[100]
                                              : Colors.orange[100],
                                          child: Text(
                                            isCorrect
                                                ? 'KEMBALI KE HOME'
                                                : 'COBA LAGI...',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalRow(List<Animal> rowAnimals) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowAnimals.map((animal) {
        bool isCorrectAnimal = animal.name == correctAnimal.name;

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: isCorrectAnimal && isCorrect
                ? Border.all(color: Colors.green, width: 2)
                : null,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Image.asset(
            animal.imageAsset,
            height: 70,
            width: 70,
          ),
        );
      }).toList(),
    );
  }
}
