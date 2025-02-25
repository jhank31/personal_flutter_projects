import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.title,
    required this.automaticallyImplyLeading,
    required this.appBarColor,
    super.key,
  });

  /// Titulo de la barra de navegación
  final String title;

  /// Valida si se debe mostrar el botón de regreso automáticamente
  final bool automaticallyImplyLeading;

  /// Color de la barra de navegación
  final Color appBarColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: appBarColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }
}
