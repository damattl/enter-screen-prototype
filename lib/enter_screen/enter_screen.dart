import 'package:flutter/material.dart';
import 'package:linum_enter_screen/enter_screen/view_models/enter_screen_view_model.dart';
import 'package:linum_enter_screen/enter_screen/widgets/enter_screen_button.dart';
import 'package:linum_enter_screen/enter_screen/widgets/enter_screen_text_field.dart';
import 'package:linum_enter_screen/enter_screen/widgets/quick_tag_menu.dart';
import 'package:provider/provider.dart';

class EnterScreen extends StatelessWidget {
  const EnterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ChangeNotifierProvider(
            create: (context) {
              return EnterScreenViewModel.empty(context);
            },
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  child: const EnterScreenTextField(),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: const [
                      Expanded(
                        child: QuickTagMenu(),
                      ),
                      EnterScreenButton()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// TODO: Implement saving functionality
