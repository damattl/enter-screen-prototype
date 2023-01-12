import 'package:easy_localization/easy_localization.dart';
import 'package:linum_enter_screen/input_parser/constants/parsable_date_map.dart';
import 'package:linum_enter_screen/input_parser/enums/week_day.dart';

final supportedDates = <String, ParsableDate> {
  "tmrw": ParsableDate.tomorrow,
  "tmr": ParsableDate.tomorrow,
};

void initSupportedDates() {
  for (final entry in parsableDateMap.entries) {
    supportedDates[entry.value.tr().toLowerCase()] = entry.key;
    supportedDates[entry.key.name] = entry.key;
  }
}