import 'package:easy_localization/easy_localization.dart';
import 'package:linum_enter_screen/enter_screen/constants/suggestion_defaults.dart';
import 'package:linum_enter_screen/enter_screen/enums/input_flag.dart';
import 'package:linum_enter_screen/enter_screen/models/enter_screen_input.dart';
import 'package:tuple/tuple.dart';

class ExampleStringBuilder {
  final num defaultAmount;
  final String defaultCurrency;
  final String defaultName;
  final String defaultCategory;
  final String defaultDate;
  final String defaultRepeatInfo;

  late Tuple2<String, String> value;

  ExampleStringBuilder({
    required this.defaultAmount,
    required this.defaultCurrency,
    required this.defaultName,
    required this.defaultCategory,
    required this.defaultDate,
    required this.defaultRepeatInfo,
  }) {
    build();
  }

  String _buildCategoryString({String? category}) {
    return "#${flagSuggestionDefaults[InputFlag.category]?.tr()}:"
        "${(category ?? defaultCategory).tr()}";
  }

  String _buildDateString({String? date}) {
    return "#${flagSuggestionDefaults[InputFlag.date]?.tr()}:"
        "${(date ?? defaultDate).tr()}";
  }

  String _buildRepeatInfoString({String? repeatInfo}) {
    return "#${flagSuggestionDefaults[InputFlag.repeatInfo]?.tr()}:"
        "${(repeatInfo ?? defaultRepeatInfo).tr()}";
  }

  void build() {
    final str2 = "$defaultAmount $defaultCurrency $defaultName "
        "${_buildCategoryString()} "
        "${_buildDateString()} "
        "${_buildRepeatInfoString()}";
    value = Tuple2("", str2);
    // 0,00 € Name #Kategorie:Keine #Datum:Heute
    // 30,0 USD #Datum:Gestern #Kategorie:Einnahmen
    // 30,0 USD #Datum:Gestern '#Kategorie:Keine'
  }

  void rebuild(EnterScreenInput parsed) {
    print(parsed.raw);

    final str2 = "${parsed.hasAmount ? "" : "$defaultAmount "}"
        "${parsed.hasCurrency ? "" : "$defaultCurrency "} "
        "${parsed.hasName ? "" : "$defaultName "} "
        "${parsed.hasCategory ? "" : "${_buildCategoryString()} "}"
        "${parsed.hasDate ? "" : "${_buildDateString()} "}"
        "${parsed.hasRepeatInfo ? "" : "${_buildRepeatInfoString()} "}";
    value = Tuple2(parsed.raw, str2);
  }
}
