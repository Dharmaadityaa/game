import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Force landscape orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MenuPage());
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Si UDIN',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Bubblegum',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFAA00), // Orange sky color
              Color(0xFFFFDD00), // Light orange/yellow for lower sky
            ],
          ),
        ),
        child: Stack(
          children: [
            // Sun
            Positioned(
              top: size.height * 0.1,
              right: size.width * 0.2,
              child: Container(
                width: size.width * 0.15,
                height: size.width * 0.15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFEE44),
                ),
              ),
            ),

            // Birds in the sky
            Positioned(
              top: size.height * 0.15,
              left: size.width * 0.3,
              child: Row(
                children: [
                  _buildBird(),
                  SizedBox(width: size.width * 0.02),
                  _buildBird(),
                  SizedBox(width: size.width * 0.01),
                  _buildBird(),
                ],
              ),
            ),

            // Left green bush
            Positioned(
              left: 0,
              top: size.height * 0.2,
              bottom: 0,
              child: Container(
                width: size.width * 0.15,
                decoration: const BoxDecoration(
                  color: Color(0xFF44AA44),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 10,
                      top: size.height * 0.2,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 25,
                      top: size.height * 0.3,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Right green bushes
            Positioned(
              right: 0,
              top: size.height * 0.15,
              bottom: 0,
              child: Container(
                width: size.width * 0.2,
                decoration: const BoxDecoration(
                  color: Color(0xFF44AA44),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 15,
                      top: size.height * 0.15,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35,
                      top: size.height * 0.25,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 55,
                      top: size.height * 0.35,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Ground with path
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: size.height * 0.3,
              child: CustomPaint(
                size: Size(size.width, size.height * 0.3),
                painter: GroundPathPainter(),
              ),
            ),

            // Start button (Mulai)
            Positioned(
              bottom: size.height * 0.18,
              right: size.width * 0.2,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenuSelectionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF88FF00),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Mulai',
                    style: TextStyle(
                      fontSize: size.height * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // Tiger character
            Positioned(
              left: size.width * 0.1,
              bottom: size.height * 0.12,
              width: size.width * 0.3,
              height: size.height * 0.6,
              child: Image.asset(
                'assets/images/tiger.png',
                fit: BoxFit.contain,
              ),
            ),

            // Logo text
            Positioned(
              right: size.width * 0.1,
              top: size.height * 0.25,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Si",
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: size.height * 0.12,
                          fontWeight: FontWeight.bold,
                          height: 0.8,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "U",
                        style: TextStyle(
                          color: const Color(0xFFCCFF00),
                          fontSize: size.height * 0.12,
                          fontWeight: FontWeight.bold,
                          height: 0.8,
                        ),
                      ),
                      Text(
                        "D",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: size.height * 0.12,
                          fontWeight: FontWeight.bold,
                          height: 0.8,
                        ),
                      ),
                      Text(
                        "I",
                        style: TextStyle(
                          color: const Color(0xFFCCFF00),
                          fontSize: size.height * 0.12,
                          fontWeight: FontWeight.bold,
                          height: 0.8,
                        ),
                      ),
                      Text(
                        "N",
                        style: TextStyle(
                          color: const Color(0xFFFF8800),
                          fontSize: size.height * 0.12,
                          fontWeight: FontWeight.bold,
                          height: 0.8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Bermain Dan Belajar',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: size.height * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Settings gear icon
            Positioned(
              top: size.height * 0.05,
              right: size.width * 0.05,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: size.height * 0.05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBird() {
    return const CustomPaint(
      size: Size(20, 10),
      painter: BirdPainter(),
    );
  }
}

class BirdPainter extends CustomPainter {
  const BirdPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black54
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw simple bird shape (like an "m" or "w")
    final path = Path()
      ..moveTo(0, size.height / 2)
      ..quadraticBezierTo(
        size.width / 4,
        0,
        size.width / 2,
        size.height / 2,
      )
      ..quadraticBezierTo(
        3 * size.width / 4,
        size.height,
        size.width,
        size.height / 2,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class GroundPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final groundPaint = Paint()
      ..color = const Color(0xFF88CC66)
      ..style = PaintingStyle.fill;

    final pathPaint = Paint()
      ..color = const Color(0xFFCCDD88)
      ..style = PaintingStyle.fill;

    // Draw ground
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      groundPaint,
    );

    // Draw path
    final path = Path()
      ..moveTo(size.width * 0.4, 0)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.5,
        size.width * 0.6,
        size.height,
      )
      ..lineTo(size.width * 0.4, size.height)
      ..quadraticBezierTo(
        size.width * 0.45,
        size.height * 0.5,
        size.width * 0.4,
        0,
      );

    canvas.drawPath(path, pathPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Menu Selection Screen that appears after pressing "Mulai" button
class MenuSelectionScreen extends StatelessWidget {
  const MenuSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/menu_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Top left home button
            Positioned(
              top: size.height * 0.1,
              left: size.width * 0.05,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),

            // Title "Menu Select" at top
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                "Menu Select",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Top-right rainbow corner
            Positioned(
              top: 0,
              right: 0,
              child: CustomPaint(
                size: Size(size.width * 0.2, size.height * 0.15),
                painter: RainbowCornerPainter(),
              ),
            ),

            // Menu Options Grid
            Positioned(
              top: size.height * 0.22,
              left: size.width * 0.05,
              right: size.width * 0.05,
              bottom: size.height * 0.1,
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.1,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildGameOption(
                    context,
                    'Tebak\nGambar',
                    'assets/images/tebak_gambar.png',
                    Colors.blue.withOpacity(0.7),
                  ),
                  _buildGameOption(
                    context,
                    'Tebak\nSuara',
                    'assets/images/tebak_suara.png',
                    Colors.blue.withOpacity(0.7),
                  ),
                  _buildGameOption(
                    context,
                    'Nama\nBuah',
                    'assets/images/nama_buah.png',
                    Colors.yellow.withOpacity(0.7),
                  ),
                  _buildGameOption(
                    context,
                    'Tebak\nHuruf',
                    'assets/images/tebak_huruf.png',
                    Colors.pink.withOpacity(0.7),
                  ),
                  _buildGameOption(
                    context,
                    'Tebak\nBentuk',
                    'assets/images/tebak_bentuk.png',
                    Colors.red.withOpacity(0.7),
                  ),
                  // Tiger character at bottom right
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(
                      'assets/images/tiger.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameOption(
      BuildContext context, String title, String imagePath, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Game image
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePath,
                height: 100,
              ),
            ),
          ),

          // Game title at bottom
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RainbowCornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];

    final double stripeHeight = size.height / colors.length;

    for (int i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;

      final path = Path()
        ..moveTo(size.width - (i * size.width / colors.length), 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width, i * stripeHeight)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
