import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void _onSelection(MapEntry<String, String> entry) {}

class EnterScreenSuggestionList extends StatelessWidget {
  final Map<String, String> suggestions;
  final void Function(MapEntry<String, String> entry) onSelection;

  const EnterScreenSuggestionList({
    super.key,
    required this.suggestions,
    this.onSelection = _onSelection,
  });

  void selectSuggested(MapEntry<String, String> entry) {
    onSelection(entry);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 250,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Colors.white70,
        boxShadow: suggestions.isNotEmpty
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 6,
                  blurRadius: 6,
                  offset: const Offset(0.5, 3), // changes position of shadow
                ),
              ]
            : null,
      ),
      child: ListView(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: suggestions.entries
            .map((e) => GestureDetector(
                  onTap: () => selectSuggested(e),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.5, horizontal: 10),
                    child: Text(
                      e.value.tr(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
