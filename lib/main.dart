import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:linum_enter_screen/input_parser/constants/parsable_date_map.dart';
import 'package:linum_enter_screen/input_parser/utils/supported_dates.dart';
import 'package:linum_enter_screen/input_parser/widgets/enter_screen_text_field.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
          supportedLocales: const [
            Locale("de", "DE")
          ],
          path: 'lang',
          fallbackLocale: const Locale('de', 'DE'),
          child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initSupportedDates();
    return MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const EnterScreen(title: 'EnterScreenPrototype'),
    );
  }
}

class EnterScreen extends StatefulWidget {
  const EnterScreen({super.key, required this.title});

  final String title;

  @override
  State<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            EnterScreenTextField(),
          ],
        )
      ),
    );
  }
}


