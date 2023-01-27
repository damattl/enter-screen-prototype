import 'package:flutter/material.dart';

enum RepeatDurationType {
  seconds,
  months,
}

class RepeatConfiguration {
  final String label;
  final IconData icon;
  final int? duration;
  final RepeatDurationType? durationType;

  const RepeatConfiguration({
    required this.label,
    required this.icon,
    required this.duration,
    required this.durationType,
  });
}
