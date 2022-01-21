import 'package:flutter/material.dart';
import '/util/constants/color_constants.dart';
import '/util/ui/atl_text.dart';

class TransactionUI extends StatefulWidget {
  const TransactionUI({Key? key}) : super(key: key);

  @override
  _TransactionUIState createState() => _TransactionUIState();
}

class _TransactionUIState extends State<TransactionUI> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ATLColorConstants.black,
      body: Center(
        child: ATLText(txt: "Transaction..."),
      ),
    );
  }
}
