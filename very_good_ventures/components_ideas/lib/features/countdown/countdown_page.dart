import 'package:components_ideas/features/countdown/bloc/countdown_bloc.dart';
import 'package:components_ideas/features/countdown/view/countdown_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownPage extends StatelessWidget {
  const CountdownPage({
    required this.targetDateTime,
    super.key,
  });

  final DateTime targetDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => CountdownBloc()
          ..add(StartCountdownEvent(targetDateTime: targetDateTime)),
        child: const CountdownView(),
      ),
    );
  }
}
