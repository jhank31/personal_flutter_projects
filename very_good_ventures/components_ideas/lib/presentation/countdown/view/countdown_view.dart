import 'package:auto_route/auto_route.dart';
import 'package:components_ideas/core/theming/core/bloc/bloc/theme_bloc.dart';
import 'package:components_ideas/core/theming/theme/themes.dart';
import 'package:components_ideas/presentation/countdown/bloc/countdown_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownView extends StatelessWidget {
  const CountdownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta regresiva'),
        leading: AutoLeadingButton(
          builder: (context, leadingType, action) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: action,
            );
          },
        ),
      ),
      body: Center(
        child: BlocBuilder<CountdownBloc, CountdownState>(
          builder: (context, state) {
            if (state is CountdownRunning) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountdownItem(
                      type: 'Días',
                      value: state.remainingTime.inDays,
                    ),
                    const SizedBox(width: 20),
                    CountdownItem(
                      type: 'Horas',
                      value: state.remainingTime.inHours % 24,
                      hasTowPoints: true,
                    ),
                    const SizedBox(width: 20),
                    CountdownItem(
                      type: 'Minutos',
                      value: state.remainingTime.inMinutes % 60,
                      hasTowPoints: true,
                    ),
                    const SizedBox(width: 20),
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'light',
            onPressed: () {
              context.read<ThemeBloc>().add(
                    const BlocThemeChangedEvent(AppThemes.light),
                  );
            },
            child: const Icon(Icons.sunny),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            heroTag: 'dark',
            onPressed: () {
              context.read<ThemeBloc>().add(
                    const BlocThemeChangedEvent(AppThemes.dark),
                  );
            },
            child: const Icon(Icons.nightlight_round),
          ),
        ],
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$value ${hasTowPoints ? ':' : ''}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          type,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
