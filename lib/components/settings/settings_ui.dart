import 'package:flutter/material.dart';
import '/util/constants/color_constants.dart';
import '/util/ui/atl_text.dart';

class SettingsUI extends StatefulWidget {
  const SettingsUI({Key? key}) : super(key: key);

  @override
  _SettingsUIState createState() => _SettingsUIState();
}

class _SettingsUIState extends State<SettingsUI> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ATLColorConstants.black,
      body: Center(
        child: ATLText(txt: "Settings..."),
      ),
    );
  }
}
