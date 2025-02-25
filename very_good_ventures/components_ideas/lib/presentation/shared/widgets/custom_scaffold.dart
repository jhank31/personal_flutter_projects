import 'package:components_ideas/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    required this.child,
    this.appBar,
    super.key,
  });

  /// El widget que se mostrará en el cuerpo del Scaffold
  final Widget child;

  /// Titulo de la barra de navegación
  final Widget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(Sizes.p60),
              child: appBar!,
            )
          : null,
      body: child,
    );
  }
}
