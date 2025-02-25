import 'package:auto_route/auto_route.dart';
import 'package:components_ideas/presentation/counter/bloc/counter_bloc.dart';
import 'package:components_ideas/presentation/counter/custom_bloc/custom_bloc.dart';
import 'package:components_ideas/presentation/counter/view/counter_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      bloc: CounterBloc(),
      child: const CounterView(),
    );
  }
}
