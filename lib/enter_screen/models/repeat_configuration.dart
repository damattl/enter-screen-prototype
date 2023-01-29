import 'package:flutter/material.dart';
import 'package:linum_enter_screen/enter_screen/enums/repeat_interval.dart';

enum RepeatDurationType {
  seconds,
  months,
}

class RepeatConfiguration {
  final RepeatInterval interval;
  final String label;
  final IconData icon;
  final int? duration;
  final RepeatDurationType? durationType;

  const RepeatConfiguration({
    required this.interval,
    required this.label,
    required this.icon,
    required this.duration,
    required this.durationType,
  });
}
