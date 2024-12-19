// ignore_for_file: unused_element

import 'dart:async';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';


//part 'json_counter_down_builder.json.g.dart';

@jsonWidget
abstract class _JsonCounterDownBuilder extends JsonWidgetBuilder {
  const _JsonCounterDownBuilder({
    required super.args,
  });

  @override
  CountDownTimer buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({super.key, this.targetDateTime});

  final DateTime? targetDateTime;

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  late Timer _timer;
  // ignore: use_named_constants, unused_field, prefer_final_fields
  Duration _remainingTime = const Duration();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _updateRemainingTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      _updateRemainingTime();
    });
  }

  void _updateRemainingTime() {
    final now = DateTime.now();
    setState(() {
      _remainingTime = widget.targetDateTime!.difference(now);
      if (_remainingTime.isNegative) {
        _remainingTime = Duration.zero;
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 250,
      child: Center(
        child: Text(
          _formatDuration(_remainingTime),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final seconds = duration.inSeconds % 60;
    final minutes = duration.inMinutes % 60;
    final hours = duration.inHours % 24;
    final days = duration.inDays;

    return '$days days, $hours hours, $minutes minutes, $seconds seconds';
  }
}

// const countdownJson = '''
// {
//   "type": "count_down_timer",
//   "args": {
//     "targetDateTime": "2024-30-22"
//   }
// }
// ''';
