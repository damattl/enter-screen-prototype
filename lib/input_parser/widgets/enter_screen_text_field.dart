
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:linum_enter_screen/input_parser/constants/parsable_date_map.dart';
import 'package:linum_enter_screen/input_parser/enums/week_day.dart';
import 'package:linum_enter_screen/input_parser/linum_input_parser.dart';
import 'package:linum_enter_screen/input_parser/models/enter_screen_input.dart';
import 'package:linum_enter_screen/input_parser/utils/example_string_builder.dart';
import 'package:linum_enter_screen/input_parser/utils/suggestions.dart';
import 'package:linum_enter_screen/input_parser/widgets/enter_screen_suggestion_list.dart';

class EnterScreenTextField extends StatefulWidget {
  final void Function(EnterScreenInput input)? onInputChange;
  const EnterScreenTextField({super.key, this.onInputChange});

  @override
  State<EnterScreenTextField> createState() => _EnterScreenTextFieldState();
}

class _EnterScreenTextFieldState extends State<EnterScreenTextField> {
  late TextEditingController _controller;
  final GlobalKey _key = LabeledGlobalKey("text_field");
  OverlayEntry? _overlayEntry;
  Map<String, String> suggestions = {};
  final exampleStringBuilder = ExampleStringBuilder(
      defaultAmount: 0.00,
      defaultCurrency: "EUR",
      defaultName: "Name",
      defaultCategory: "Keine",
      defaultDate: parsableDateMap[ParsableDate.today]!,
      defaultRepeatInfo: "Keine"
  );

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void rebuildSuggestionList() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    final keyContext = _key.currentContext;
    if (keyContext == null) {
      return;
    }
    final renderBox = keyContext.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = _overlayEntryBuilder(context, size, position);
    print("hi there");
    Overlay.of(context)?.insert(_overlayEntry!);
  }

  void _onSuggestionSelection(MapEntry<String, String> entry) {
    final value = insertSuggestion(
        entry,
        _controller.text,
        _controller.selection.base.offset
    );
    final parsed = parse(value.text);

    _controller.value = value;

    setState(() {
      exampleStringBuilder.rebuild(parsed);
      suggestions = makeSuggestions(value.text, value.selection.base.offset);

      rebuildSuggestionList();
    });
  }

  OverlayEntry _overlayEntryBuilder(
      BuildContext context,
      Size size,
      Offset position,
  ) {
    return OverlayEntry(builder: (context) {
      return Positioned(
        bottom: position.dy - (size.height / 2),
        left: position.dx,
        width: size.width,
        child: Material(
          child: EnterScreenSuggestionList(
            suggestions: suggestions,
            onSelection: _onSuggestionSelection,
          ),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(40),
        child: Stack(
          children: [
            Positioned(
              top: 15,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(exampleStringBuilder.value.item1,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.teal),
                    child: Text(exampleStringBuilder.value.item2,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ],
              )
            ),
            TextField(
              key: _key,
              controller: _controller,
              onChanged: (text) {
                final result = parse(text);
                final cursor = _controller.selection.base.offset;
                final suggestions = makeSuggestions(text, cursor);
                exampleStringBuilder.rebuild(result);
                setState(() {

                  this.suggestions = suggestions;
                  rebuildSuggestionList();
                });
              },
            )
          ],
        )
    );
  }
}
