import 'package:components_ideas/presentation/counter/bloc/counter_bloc.dart';
import 'package:components_ideas/presentation/counter/custom_bloc/custom_bloc.dart';
import 'package:flutter/material.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      body: Center(
        child: BlocListener<CounterBloc, int>(
          bloc: counterBloc,
          listener: (context, state) {
            if (state == 10) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('¡Has llegado a 10!'),
                ),
              );
            }
          },
          child: BlocBuilder<CounterBloc, int>(
            bloc: counterBloc,
            builder: (context, count) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Contador: $count',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => counterBloc.add(DecrementEvent()),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => counterBloc.add(IncrementEvent()),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
