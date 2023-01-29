import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:linum_enter_screen/enter_screen/enter_screen.dart';
import 'package:linum_enter_screen/enter_screen/utils/supported_dates.dart';
import 'package:linum_enter_screen/enter_screen/utils/supported_repeat_configs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale("de", "DE")],
    path: 'lang',
    fallbackLocale: const Locale('de', 'DE'),
    child: const EnterScreenPrototype(),
  ));
}

class EnterScreenPrototype extends StatelessWidget {
  const EnterScreenPrototype({super.key});

  @override
  Widget build(BuildContext context) {
    initSupportedDates();
    initSupportedRepeatIntervals();

    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EnterScreen"),
      ),
      body: const Align(
        alignment: Alignment.bottomCenter,
        child: EnterScreen(),
      ),
    );
  }
}
