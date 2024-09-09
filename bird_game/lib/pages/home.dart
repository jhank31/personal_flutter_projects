import 'dart:async';

import 'package:bird_game/platform_services.dart';
import 'package:bird_game/widgets/barriers.dart';
import 'package:bird_game/widgets/bird.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static double birdYaxis = 0;
  double initialHeight = birdYaxis;
  double time = 0;
  double height = 0;
  double gravity = -4.9;
  double velocity = 3.5;
  double birdWidth = 0.1;
  double birdHeight = 0.1;

  bool gameHasStarted = false;
  bool gameHasFinished = false;

  //variables de las barras
  static List<double> barrierX = [2, 2 + 1.5];
  static double barrierWidth = 0.5;
  List<List<double>> barrierHeight = [
    [0.6, 0.4],
    [0.4, 0.6],
  ];

  void startGame() {
    gameHasStarted = true;
    gameHasFinished = true;

    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      height = gravity * time * time + velocity * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });

      if (birdIsDead()) {
        timer.cancel();
        gameHasStarted = false;
        _showDialog();
      }

      moveMap();

      time += 0.01;
    });
  }

  void moveMap() {
    for (int i = 0; i < barrierX.length; i++) {
      setState(() {
        barrierX[i] -= 0.005;
      });

      if (barrierX[i] < -1.5) {
        barrierX[i] += 3;
      }
    }
  }

  void resetGame() {
    gameHasFinished = false;
    Navigator.pop(context);
    setState(() {
      birdYaxis = 0;
      time = 0;
      initialHeight = birdYaxis;
      barrierX = [2, 2 + 1.5];
      barrierWidth = 0.5;
      barrierHeight = [
        [0.6, 0.4],
        [0.4, 0.6],
      ];
    });
  }

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  Widget showTextStart() {
    if (!gameHasFinished) {
      return const Text(
        'T A P  T O  G A M E',
        style: TextStyle(color: Colors.white, fontSize: 25),
      );
    }
    if (gameHasFinished) {
      return const Text('');
    }
    return const Text('');
  }

  bool birdIsDead() {
    if (birdYaxis < -1 || birdYaxis > 1) {
      gameHasFinished = true;
      return true;
    }

    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth &&
          (barrierX[i] + barrierWidth >= -birdWidth &&
              (birdYaxis <= -1 + barrierHeight[i][0] ||
                  birdYaxis + birdHeight >= 1 - barrierHeight[i][1]))) {
        return true;
      }
    }

    return false;
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: const Center(child: Text('G A M E  O V E R')),
            actions: [
              GestureDetector(
                  onTap: resetGame,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    color: Colors.white,
                    child: const Text(
                      'P L A Y  A G A I N',
                      style: TextStyle(color: Colors.brown),
                    ),
                  ))
            ],
          );
        });
  }
  void openPartnersNutresaApp() async {
    await PlatformService().openThirdPartyApp('com.celuweb.pidekyapp');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.red,
                child: const Icon(
                  Icons.person_4,
                  color: Colors.white,
                ),
                onPressed: () {
                  openPartnersNutresaApp();
                }),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                child: Center(
                    child: Stack(
                  children: [
                    Bird(
                      birdY: birdYaxis,
                      birdHeight: birdHeight,
                      birdWidth: birdWidth,
                    ),
                    Container(
                        alignment: const Alignment(0, -0.5),
                        child: showTextStart()),
                    //barra superior 0
                    Barriers(
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[0][0],
                      barrierX: barrierX[0],
                      isThisBottomBarrier: false,
                    ),
                    //barra inferior 0
                    Barriers(
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[0][1],
                      barrierX: barrierX[0],
                      isThisBottomBarrier: true,
                    ),
                    //barra superior 1
                    Barriers(
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[1][0],
                      barrierX: barrierX[1],
                      isThisBottomBarrier: false,
                    ),
                    //barra inferior 1
                    Barriers(
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[1][1],
                      barrierX: barrierX[1],
                      isThisBottomBarrier: true,
                    ),
                  ],
                )),
              ),
            ),
            Container(
              height: 15,
              color: Colors.green.shade900,
            ),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.brown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'CREADO POR JHANCARLOS',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('❤️',
                          style: TextStyle(color: Colors.white, fontSize: 35))
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
