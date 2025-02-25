import 'package:auto_route/auto_route.dart';
import 'package:components_ideas/presentation/my_account/view/my_account_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyAccountPage extends StatelessWidget {
   
  const MyAccountPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MyAccountView();
  }
}
