import 'package:flutter/material.dart';
import '/components/home/home_ui.dart';
import '/components/settings/settings_ui.dart';
import '/components/swap/swap_ui.dart';
import '/components/transaction/transaction_ui.dart';
import '/util/ui/atl_bottom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark, primaryColorDark: Colors.black),
      darkTheme: ThemeData(brightness: Brightness.dark, primaryColorDark: Colors.black),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    const HomeUI(),
    const SwapUI(),
    const TransactionUI(),
    const SettingsUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: ATLBottomAppBar(pages: pages),
    );
  }
}
