

import 'package:linum_enter_screen/input_parser/models/category.dart';

const standardCategories = <String, Category> {
  "salary": Category(
    label: "settings_screen.standard-income-selector.salary",
    id: "salary",
    isIncome: true,
  ),
  "allowance": Category(
    label: "settings_screen.standard-income-selector.allowance",
    id: "allowance",
    isIncome: true,
  ),
  "sidejob": Category(
    label: "settings_screen.standard-income-selector.sidejob",
    id: "sidejob",
    isIncome: true,
  ),
  "investments": Category(
    label: "settings_screen.standard-income-selector.investments",
    id: "investments",
    isIncome: true,
  ),
  "childsupport": Category(
    label: "settings_screen.standard-income-selector.childsupport",
    id: "childsupport",
    isIncome: true
  ),
  "interest": Category(
    label: "settings_screen.standard-income-selector.interest",
    id: "interest",
    isIncome: true
  ),

  "food": Category(
    label: "settings_screen.standard-expense-selector.food",
    id: "food",
  ),
  "freetime": Category(
    label: "settings_screen.standard-expense-selector.freetime",
    id: "freetime",
  ),
  "house": Category(
    label: "settings_screen.standard-expense-selector.house",
    id: "house",
  ),
  "lifestyle": Category(
    label: "settings_screen.standard-expense-selector.lifestyle",
    id: "lifestyle",
  ),
  "car": Category(
    label: "settings_screen.standard-expense-selector.car",
    id: "car",
  ),

  "misc-income": Category(
    label: "settings_screen.standard-income-selector.misc",
    id: "misc-income",

  ),
  "misc-expense": Category(
    label: "settings_screen.standard-expense-selector.misc",
    id: "misc-expense",

  ),
};