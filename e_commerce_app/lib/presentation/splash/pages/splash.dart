import 'package:e_commers_app/core/configs/assets/app_images.dart';
import 'package:e_commers_app/core/theme/app_colors.dart';
import 'package:e_commers_app/presentation/auth/pages/sigin.dart';
import 'package:e_commers_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:e_commers_app/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (BuildContext context, state) {
        if (state is Unauthenticated) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SinginPage()));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
