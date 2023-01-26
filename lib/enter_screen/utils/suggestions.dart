import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:linum_enter_screen/enter_screen/constants/input_flag_map.dart';
import 'package:linum_enter_screen/enter_screen/constants/standard_categories.dart';
import 'package:linum_enter_screen/enter_screen/constants/suggestion_defaults.dart';
import 'package:linum_enter_screen/enter_screen/constants/parsable_date_map.dart';
import 'package:linum_enter_screen/enter_screen/enums/input_flag.dart';
import 'package:linum_enter_screen/enter_screen/utils/input_parser.dart';
import 'package:linum_enter_screen/enter_screen/utils/supported_dates.dart';

TextEditingValue insertSuggestion(
    MapEntry<String, String> entry, String oldText, int oldCursor) {
  final translatedValue =
      entry.value.tr() + (suggestionIsFlag(entry.key) ? ":" : "");
  final preCursorText = oldText.substring(0, oldCursor);
  final lastTagPosition = preCursorText.lastIndexOf(RegExp(r'[#@:]'));

  final cleanedPreCursorText = preCursorText.substring(0, lastTagPosition + 1);

  final newText = cleanedPreCursorText +
      translatedValue +
      oldText.substring(oldCursor, oldText.length);

  final newCursor = cleanedPreCursorText.length + translatedValue.length;
  return TextEditingValue(
      text: newText,
      selection: TextSelection.fromPosition(TextPosition(offset: newCursor)));
}

Map<String, String> makeSuggestions(String text, int cursor) {
  final textBefore = text.substring(0, cursor).split('#');
  final textAfter = text.substring(cursor, text.length).split('#');
  if (textBefore.length == 1) {
    return {};
  }
  final preCursorText = textBefore[textBefore.length - 1];
  final cursorText = preCursorText + textAfter[0];

  final parsed = parseTag(preCursorText);
  if (parsed.item1 == null) {
    final suggestions = suggestFlags(parsed.item2);
    if (suggestions.isNotEmpty) {
      return suggestions;
    } else {
      return suggestCategory(parsed.item2);
    }
  }

  switch (parsed.item1) {
    case InputFlag.category:
      return suggestCategory(parsed.item2);
    case InputFlag.date:
      return suggestDate(parsed.item2);
    case InputFlag.repeatInfo:
      return suggestRepeatInfo(parsed.item2);
    default:
      return suggestCategory(parsed.item2);
  }
}

Map<String, String> suggestFlags(String text) {
  final Map<String, String> suggestions = {};
  final uppercase = text.toUpperCase();
  for (final entry in inputFlagMap.entries) {
    String? keySubstr;
    if (entry.key.length > text.length) {
      keySubstr = entry.key.substring(0, text.length);
    }
    if (keySubstr == uppercase) {
      suggestions[entry.value.name] = flagSuggestionDefaults[entry.value]!;
    }
  }
  return suggestions;
}

Map<String, String> suggestCategory(String text) {
  final Map<String, String> suggestions = {};
  final lowercase = text.toLowerCase();
  for (final entry in standardCategories.entries) {
    String? valueSubstr;
    final translatedLabel = entry.value.label.tr().toLowerCase();
    if (translatedLabel.length > text.length) {
      valueSubstr = translatedLabel.substring(0, text.length);
    }

    String? keySubstr;
    if (entry.key.length > text.length) {
      keySubstr = entry.key.substring(0, text.length);
    }

    if (keySubstr == lowercase || valueSubstr == lowercase) {
      suggestions[entry.key] = entry.value.label;
    }
  }

  return suggestions;
}

Map<String, String> suggestDate(String text) {
  final Map<String, String> suggestions = {};
  final lowercase = text.toLowerCase();
  print(supportedDates);
  for (final entry in supportedDates.entries) {
    String? substr;
    if (entry.key.length > text.length) {
      substr = entry.key.substring(0, text.length);
    }

    if (substr == lowercase && parsableDateMap[entry.value] != null) {
      suggestions[entry.value.name] = parsableDateMap[entry.value]!
          .tr(); // TODO: Convert back to parsableDateMap
    }
  }

  return suggestions;
}

Map<String, String> suggestRepeatInfo(String text) {
  return {};
}

bool suggestionIsFlag(String suggestion) {
  final flag = flagSuggestionDefaults.keys
      .firstWhereOrNull((key) => key.name == suggestion);
  return flag != null;
}
