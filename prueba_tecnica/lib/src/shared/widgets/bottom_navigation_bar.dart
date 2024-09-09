import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/src/provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationDestinationLabelBehavior labelBehavior =
        NavigationDestinationLabelBehavior.alwaysShow;
    final bottomNavigationBarProvider =
        Provider.of<CustomBottomNavigationBarProvider>(context);
    return NavigationBar(
        
        labelBehavior: labelBehavior,
        selectedIndex: bottomNavigationBarProvider.currentIndex,
        onDestinationSelected: (index) {
          bottomNavigationBarProvider.currentIndex = index;
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.send_to_mobile),
            label: 'Transacciones',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Tus ransacciones',
          ),
        ]);
  }
}
