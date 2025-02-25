import 'package:auto_route/auto_route.dart';
import 'package:components_ideas/presentation/theme/view/theme_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ThemePage extends StatelessWidget {
   
  const ThemePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const ThemeView();
  }
}
