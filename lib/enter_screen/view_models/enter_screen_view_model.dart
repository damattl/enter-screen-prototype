import 'package:flutter/material.dart';
import 'package:linum_enter_screen/enter_screen/constants/standard_categories.dart';
import 'package:linum_enter_screen/enter_screen/constants/standard_currencies.dart';
import 'package:linum_enter_screen/enter_screen/enums/input_flag.dart';
import 'package:linum_enter_screen/enter_screen/models/category.dart';
import 'package:linum_enter_screen/enter_screen/models/currency.dart';
import 'package:linum_enter_screen/enter_screen/models/enter_screen_input.dart';

class EnterScreenViewModel extends ChangeNotifier {
  Currency? _selectedCurrency;
  late Currency _defaultCurrency;
  Category? _selectedCategory;
  late Category? _defaultCategory;
  String? _selectedDate;
  late String _defaultDate;

  EnterScreenViewModel(BuildContext context) {
    _defaultCurrency = standardCurrencies["EUR"]!;
    _defaultDate = DateTime.now().toIso8601String();
    _defaultCategory = null;
  }

  Currency get currency => _selectedCurrency ?? _defaultCurrency;
  Category? get category => _selectedCategory ?? _defaultCategory;
  String get date => _selectedDate ?? _defaultDate;
  String? get repeatInfo => null; // TODO: Implement

  void setInput(EnterScreenInput input) {
    _selectedCurrency = standardCurrencies[input.currency];
    for (var element in input.parsedInputs) {
      switch (element.item1) {
        case InputFlag.category:
          _selectedCategory = standardCategories[element.item2];
          break;
        case InputFlag.date:
          _selectedDate = element.item2;
          break;
        case InputFlag.repeatInfo:
          break;
      }
    }
    notifyListeners();
  }
}
