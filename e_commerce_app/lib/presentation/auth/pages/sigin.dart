import 'package:e_commers_app/common/helpers/size_screen.dart';
import 'package:e_commers_app/presentation/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SinginPage extends StatelessWidget {
  const SinginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: context.screenHeight(hisVar: 0.15),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleTextAuth(
              title: 'Sign In',
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldAuth(),
          ],
        ),
      ),
    );
  }
}
