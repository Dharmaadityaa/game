import 'package:flutter/material.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final bool isCorrect;

  ResultScreen({required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset('assets/images/pensil.png', height: 100),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset('assets/images/lampu_hias.png', height: 80),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    isCorrect ? 'LUAR BIASA...' : 'COBA LAGI...',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                color: Colors.pink[100],
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Image.asset('assets/images/si_udin.png', height: 50),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('KEMBALI KE AWAL'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
