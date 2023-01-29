import 'package:flutter/material.dart';
import 'package:linum_enter_screen/enter_screen/enums/repeat_interval.dart';
import 'package:linum_enter_screen/enter_screen/models/repeat_configuration.dart';

final repeatConfigurations = <RepeatInterval, RepeatConfiguration>{
  RepeatInterval.none: const RepeatConfiguration(
    interval: RepeatInterval.none,
    label: 'enter_screen.label-repeat-none',
    icon: Icons.sync_disabled_rounded,
    duration: null,
    durationType: null,
  ),
  RepeatInterval.daily: RepeatConfiguration(
    interval: RepeatInterval.daily,
    label: 'enter_screen.label-repeat-daily',
    icon: Icons.calendar_today_rounded,
    duration: const Duration(days: 1).inSeconds,
    durationType: RepeatDurationType.seconds,
  ),
  RepeatInterval.weekly: RepeatConfiguration(
    interval: RepeatInterval.weekly,
    label: 'enter_screen.label-repeat-weekly',
    icon: Icons.calendar_view_week_rounded,
    duration: const Duration(days: 7).inSeconds,
    durationType: RepeatDurationType.seconds,
  ),
  RepeatInterval.monthly: const RepeatConfiguration(
    interval: RepeatInterval.monthly,
    label: 'enter_screen.label-repeat-30days',
    icon: Icons.calendar_view_month_rounded,
    duration: 1,
    durationType: RepeatDurationType.months,
  ),
  RepeatInterval.quarterly: const RepeatConfiguration(
    interval: RepeatInterval.quarterly,
    label: 'enter_screen.label-repeat-quarterly',
    icon: Icons.grid_view_rounded,
    duration: 3,
    durationType: RepeatDurationType.months,
  ),
  RepeatInterval.semianually: const RepeatConfiguration(
    interval: RepeatInterval.semianually,
    label: 'enter_screen.label-repeat-semiannually',
    icon: Icons.splitscreen_rounded,
    duration: 6,
    durationType: RepeatDurationType.months,
  ),
  RepeatInterval.anually: const RepeatConfiguration(
    interval: RepeatInterval.anually,
    label: 'enter_screen.label-repeat-annually',
    icon: Icons.calendar_month_rounded,
    duration: 12,
    durationType: RepeatDurationType.months,
  )

  // TODO implement custom range picker
  // {
  //   "entryCategory": EntryCategory(
  //       label: AppLocalizations.of(context)!
  //           .translate('enter_screen/label-repeat-freeselect'),
  //       icon: Icons.repeat),
  //       "duration": null,
  // },
};
