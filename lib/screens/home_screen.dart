import 'package:flutter/material.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
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
              Image.asset('assets/images/gajah.png', height: 150),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Hai... nama aku Udin,\naku akan ajak kamu mengenal hewan!\nAyo siap-siap untuk bermain!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
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
                        Navigator.pushNamed(context, '/game');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('AYO KENALI HEWAN...'),
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
