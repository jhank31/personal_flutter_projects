import 'package:auto_route/auto_route.dart';
import 'package:components_ideas/presentation/host/view/host_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HostPage extends StatelessWidget {
  const HostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HostView();
  }
}
