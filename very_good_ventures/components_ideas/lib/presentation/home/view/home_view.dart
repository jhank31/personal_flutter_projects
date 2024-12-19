import 'package:auto_route/auto_route.dart';
import 'package:components_ideas/core/router/app_router.gr.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            ListTile(
              title: const Text('Cuenta regresiva'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              leading: const Icon(Icons.timer),
              onTap: () {
                context.router.push(
                  CountdownRoute(
                    targetDateTime: DateTime.now().add(const Duration(days: 1)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
