import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/config/preferences/preferences.dart';

void showAlert(
    BuildContext context, String message, Icon icon, VoidCallback onPressed) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: icon,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                message,
                style: const TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'Ok',
            style:
                TextStyle(color: Color.fromARGB(255, 7, 80, 59), fontSize: 20),
          ),
        ),
      ],
    ),
  );
}

showAlertTextEmpty(BuildContext context) {
  final prefs = Preferencias();
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  // ignore: prefer_const_constructors
                  SizedBox(
                    child: const Icon(
                      Icons.error,
                      size: 110,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: const Text(
                      'Por favor, llene todos los campos',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Ok',
                  style: TextStyle(
                      fontSize: 20,
                      color: prefs.isDarkTheme == false
                          ? Colors.black
                          : Colors.white),
                ),
              ),
            ],
          ));
}
