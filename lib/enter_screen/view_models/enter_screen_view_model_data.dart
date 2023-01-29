import 'package:linum_enter_screen/enter_screen/constants/standard_categories.dart';
import 'package:linum_enter_screen/enter_screen/constants/standard_currencies.dart';
import 'package:linum_enter_screen/enter_screen/constants/standard_repeat_configs.dart';
import 'package:linum_enter_screen/enter_screen/enums/input_flag.dart';
import 'package:linum_enter_screen/enter_screen/enums/repeat_interval.dart';
import 'package:linum_enter_screen/enter_screen/models/category.dart';
import 'package:linum_enter_screen/enter_screen/models/currency.dart';
import 'package:linum_enter_screen/enter_screen/models/enter_screen_input.dart';
import 'package:linum_enter_screen/enter_screen/models/repeat_configuration.dart';

class EnterScreenViewModelData {
  final void Function() onUpdate;
  num? _amount;
  String? _name;
  Currency? _currency;
  Category? _category;
  String? _date;
  RepeatConfiguration? _repeatConfiguration;

  EnterScreenViewModelData(
    this.onUpdate, {
    num? amount,
    String? name,
    Currency? currency,
    Category? category,
    String? date,
    RepeatConfiguration? repeatConfiguration,
  })  : _amount = amount,
        _name = name,
        _currency = currency,
        _category = category,
        _date = date,
        _repeatConfiguration = repeatConfiguration;

  get amount => _amount;
  void setAmount(num? value, {bool notify = true}) {
    _amount = value;
    if (notify) {
      onUpdate();
    }
  }

  get name => _name;
  void setName(String? value, {bool notify = true}) {
    _name = value;
    if (notify) {
      onUpdate();
    }
  }

  get currency => _currency;
  void setCurrency(Currency? value, {bool notify = true}) {
    _currency = value;
    if (notify) {
      onUpdate();
    }
  }

  get category => _category;
  void setCategory(Category? value, {bool notify = true}) {
    _category = value;
    if (notify) {
      onUpdate();
    }
  }

  get date => _date;
  void setDate(String? value, {bool notify = true}) {
    _date = value;
    if (notify) {
      onUpdate();
    }
  }

  get repeatConfiguration => _repeatConfiguration;
  void setRepeatConfiguration(RepeatConfiguration? value,
      {bool notify = true}) {
    _repeatConfiguration = value;
    if (notify) {
      onUpdate();
    }
  }

  void setFromInput(EnterScreenInput input) {
    _amount = input.amount;
    _name = input.name;
    _currency = standardCurrencies[input.currency];

    var didSetCategory = false;
    var didSetDate = false;
    var didSetRepeatInfo = false;

    for (var element in input.parsedInputs) {
      switch (element.item1) {
        case InputFlag.category:
          _category = standardCategories[element.item2];
          didSetCategory = true;
          break;
        case InputFlag.date:
          _date = element.item2;
          didSetDate = true;
          break;
        case InputFlag.repeatInfo:
          RepeatInterval interval;
          try {
            interval = RepeatInterval.values.byName(element.item2);
          } catch (e) {
            interval = RepeatInterval.none;
          }
          _repeatConfiguration = repeatConfigurations[interval];
          didSetRepeatInfo = true;
          break;
      }
    }

    if (!didSetCategory) {
      _category = null;
    }
    if (!didSetDate) {
      _date = null;
    }
    if (!didSetRepeatInfo) {
      _repeatConfiguration = null;
    }

    onUpdate();
  }
}
