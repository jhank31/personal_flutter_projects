import 'package:auto_route/auto_route.dart';
import 'package:components_ideas/presentation/home/view/home_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
