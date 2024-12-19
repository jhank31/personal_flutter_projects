import 'package:components_ideas/core/app_life_cycle_listener/bloc/app_life_cycle_listener_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLifeCycleListener extends StatefulWidget {
  const AppLifeCycleListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<AppLifeCycleListener> createState() => _AppLifeCycleListenerState();
}

class _AppLifeCycleListenerState extends State<AppLifeCycleListener> {
  // variable en la que se guarda el listener
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    // se inicializa el listener
    _listener = AppLifecycleListener(
      onResume: _onResume,
      onStateChange: _onStateChanged,
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  void _onResume() => context
      .read<AppLifeCycleListenerBloc>()
      .add(const AppLifeCycleListenerOnResumeEvent());

  void _onStateChanged(AppLifecycleState state) => Null;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
