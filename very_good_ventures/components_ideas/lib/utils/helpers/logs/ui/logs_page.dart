import 'package:auto_route/auto_route.dart';
import 'package:components_ideas/utils/helpers/logs/logger.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// {@template logs_page}
/// Página de Logs
/// {@endtemplate}

@RoutePage()
class LogsPage extends StatelessWidget {
  const LogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TalkerScreen(
      talker: Logger.instanciaTalker,
      theme: TalkerScreenTheme(
        logColors: {
          TalkerLogType.verbose.name: Colors.green.shade300,
          TalkerLogType.exception.name: Colors.orange,
          TalkerLogType.error.name: Colors.red,
          TalkerLogType.debug.name: Colors.lightBlue[300]!,
          TalkerLogType.info.name: Colors.blue[500]!,
        },
      ),
      appBarTitle: 'Logs Page',
    );
  }
}
