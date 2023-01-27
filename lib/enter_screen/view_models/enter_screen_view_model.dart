import 'package:flutter/material.dart';
import 'package:linum_enter_screen/enter_screen/constants/standard_categories.dart';
import 'package:linum_enter_screen/enter_screen/constants/standard_currencies.dart';
import 'package:linum_enter_screen/enter_screen/constants/standard_repeat_configs.dart';
import 'package:linum_enter_screen/enter_screen/enums/input_flag.dart';
import 'package:linum_enter_screen/enter_screen/enums/repeat_interval.dart';
import 'package:linum_enter_screen/enter_screen/models/category.dart';
import 'package:linum_enter_screen/enter_screen/models/currency.dart';
import 'package:linum_enter_screen/enter_screen/models/enter_screen_input.dart';
import 'package:linum_enter_screen/enter_screen/models/repeat_configuration.dart';

class EnterScreenViewModel extends ChangeNotifier {
  Currency? _selectedCurrency;
  late Currency _defaultCurrency;
  Category? _selectedCategory;
  late Category? _defaultCategory;
  String? _selectedDate;
  late String _defaultDate;
  RepeatConfiguration? _selectedRepeatInfo;
  late RepeatConfiguration _defaultRepeatInfo;

  EnterScreenViewModel(BuildContext context) {
    _defaultCurrency = standardCurrencies["EUR"]!;
    _defaultDate = DateTime.now().toIso8601String();
    _defaultCategory = null;
    _defaultRepeatInfo = repeatConfigurations[RepeatInterval.none]!;
  }

  Currency get currency => _selectedCurrency ?? _defaultCurrency;
  Category? get category => _selectedCategory ?? _defaultCategory;
  String get date => _selectedDate ?? _defaultDate;
  RepeatConfiguration get repeatInfo =>
      _selectedRepeatInfo ?? _defaultRepeatInfo;

  void setInput(EnterScreenInput input) {
    _selectedCurrency = standardCurrencies[input.currency];

    var didSetCategory = false;
    var didSetDate = false;
    var didSetRepeatInfo = false;

    for (var element in input.parsedInputs) {
      switch (element.item1) {
        case InputFlag.category:
          _selectedCategory = standardCategories[element.item2];
          didSetCategory = true;
          break;
        case InputFlag.date:
          _selectedDate = element.item2;
          didSetDate = true;
          break;
        case InputFlag.repeatInfo:
          RepeatInterval interval;
          try {
            interval = RepeatInterval.values.byName(element.item2);
          } catch (e) {
            interval = RepeatInterval.none;
          }
          _selectedRepeatInfo = repeatConfigurations[interval];
          didSetRepeatInfo = true;
          break;
      }
    }

    if (!didSetCategory) {
      _selectedCategory = null;
    }
    if (!didSetDate) {
      _selectedDate = null;
    }
    if (!didSetRepeatInfo) {
      _selectedRepeatInfo = null;
    }

    notifyListeners();
  }
}
