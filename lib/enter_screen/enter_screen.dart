import 'package:flutter/material.dart';
import 'package:linum_enter_screen/enter_screen/view_models/enter_screen_view_model.dart';
import 'package:linum_enter_screen/enter_screen/widgets/enter_screen_text_field.dart';
import 'package:linum_enter_screen/enter_screen/widgets/quick_tag_menu.dart';
import 'package:provider/provider.dart';

class EnterScreen extends StatelessWidget {
  const EnterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EnterScreen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ChangeNotifierProvider(
              create: (context) {
                return EnterScreenViewModel(context);
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    child: const EnterScreenTextField(),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
                    child: QuickTagMenu(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
