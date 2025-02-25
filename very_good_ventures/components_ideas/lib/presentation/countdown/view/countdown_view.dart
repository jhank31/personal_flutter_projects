import 'package:components_ideas/core/constants/sizes.dart';
import 'package:components_ideas/core/theming/core/bloc/bloc/theme_bloc.dart';
import 'package:components_ideas/presentation/countdown/bloc/countdown_bloc.dart';
import 'package:components_ideas/presentation/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownView extends StatelessWidget {
  const CountdownView({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'Cuenta regresiva',
        automaticallyImplyLeading: true,
        appBarColor: Colors.transparent,
      ),
      child: Center(
        child: BlocBuilder<CountdownBloc, CountdownState>(
          builder: (context, state) {
            if (state is CountdownRunning) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountdownItem(
                      type: 'Días',
                      value: state.remainingTime.inDays,
                    ),
                    Gap.width20,
                    CountdownItem(
                      type: 'Horas',
                      value: state.remainingTime.inHours % 24,
                      hasTowPoints: true,
                    ),
                    Gap.width20,
                    CountdownItem(
                      type: 'Minutos',
                      value: state.remainingTime.inMinutes % 60,
                      hasTowPoints: true,
                    ),
                    Gap.width20,
                    CountdownItem(
                      type: 'Segundos',
                      value: state.remainingTime.inSeconds % 60,
                    ),
                  ],
                ),
              );
            } else if (state is CountdownFinished) {
              return const Text('Cuenta regresiva finalizada!');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class CountdownItem extends StatelessWidget {
  const CountdownItem({
    required this.type,
    required this.value,
    this.hasTowPoints = false,
    super.key,
  });
  final int value;
  final String type;
  final bool hasTowPoints;

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeBloc>().state.currentTheme.appTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$value ${hasTowPoints ? ':' : ''}',
          textAlign: TextAlign.center,
          style: theme.typography.xxxlBold,
        ),
        Text(
          type,
          style: theme.typography.xlBold,
        ),
      ],
    );
  }
}
