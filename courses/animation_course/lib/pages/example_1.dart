import 'dart:math';

import 'package:flutter/material.dart';

/*
un animation controller es una clase que controla la animacion de un widget
yendo de  0 a 1 y de 1 a 0 y se complementa con el animation

*/

class Exmple1 extends StatefulWidget {
  const Exmple1({super.key});

  @override
  State<Exmple1> createState() => _Exmple1State();
}

class _Exmple1State extends State<Exmple1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: pi * 2).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(_animation.value),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: 3,
                        offset: Offset(0, 4)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
