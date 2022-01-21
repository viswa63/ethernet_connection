import 'package:flutter/material.dart';
import '/util/constants/color_constants.dart';
import '/util/ui/atl_text.dart';

class SwapUI extends StatefulWidget {
  const SwapUI({Key? key}) : super(key: key);

  @override
  _SwapUIState createState() => _SwapUIState();
}

class _SwapUIState extends State<SwapUI> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ATLColorConstants.black,
      body: Center(
        child: ATLText(txt: "Swap..."),
      ),
    );
  }
}
