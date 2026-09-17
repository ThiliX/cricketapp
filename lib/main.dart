import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MiniCricketApp());
}

class MiniCricketApp extends StatelessWidget {
  const MiniCricketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Cricket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF033B79),
        scaffoldBackgroundColor: const Color(0xFF0078D7),
      ),
      home: const CricketHomePage(),
    );
  }
}

class CricketHomePage extends StatefulWidget {
  const CricketHomePage({super.key});

  @override
  State<CricketHomePage> createState() => _CricketHomePageState();
}

class _CricketHomePageState extends State<CricketHomePage> {
  int _runs = 0;
  int _balls = 6;
  String _shotResult = '';
  final Random _random = Random();
  final List<int> _possibleRuns = [0, 1, 2, 3, 4, 6];

  void _onBat() {
    if (_balls > 0) {
      setState(() {
        _balls--;
        final scored = _possibleRuns[_random.nextInt(_possibleRuns.length)];
        _runs += scored;
        if (scored == 0) {
          _shotResult = 'No Runs';
        } else {
          _shotResult = '$scored Runs';
        }
      });
    }
  }

  void _onRestart() {
    setState(() {
      _runs = 0;
      _balls = 6;
      _shotResult = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0078D7),
      appBar: AppBar(
        title: const Text(
          'Mini Cricket',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF033B79),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 380),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                // Row 1: Scores and Balls (Image, text, value inside Column inside each Row)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Column 1: Runs section (Image, text, value inside a column)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 125,
                          height: 125,
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.white,
                          child: Image.asset(
                            'assets/images/bat.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Runs',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$_runs',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    // Column 2: Balls section (Image, text, value inside a column)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 125,
                          height: 125,
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.white,
                          child: Image.asset(
                            'assets/images/ball.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Balls',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$_balls',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                // Row 2: Shot status text inside a Column inside a Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              _shotResult,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Row 3: Action button inside a Column inside a Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_balls > 0)
                          ElevatedButton(
                            onPressed: _onBat,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF033B79),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 26,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 4,
                            ),
                            child: const Text(
                              'Bat',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        else
                          ElevatedButton(
                            onPressed: _onRestart,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD0080E),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 26,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 4,
                            ),
                            child: const Text(
                              'Restart',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}
