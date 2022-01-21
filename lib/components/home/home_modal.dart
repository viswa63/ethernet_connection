import 'package:flutter/material.dart';

class HomeUIModal {
  late TabController controller;
  int activeTabIndex = 0;
  String firstName = "Viswanath Reddy";
  String lastName = "Viswa";
  bool isNetworkSheet = false;
  List<IconData> tokenIcons = [Icons.label_important_outline, Icons.grass, Icons.assessment_outlined];
  NetworkConnectionModal netConnection =
      NetworkConnectionModal(networkType: "Etlhereum Main Connection", ethValue: "70.42 ETH", ethPrice: 121.300, ethPercentage: "+ 5.42 %", tokensList: []);
}

class NetworkConnectionModal {
  String networkType;
  String ethValue;
  double ethPrice;
  String ethPercentage;
  List<TokensModal> tokensList = List<TokensModal>.empty(growable: true);

  NetworkConnectionModal({required this.networkType, required this.ethValue, required this.ethPrice, required this.ethPercentage, required this.tokensList});
}

class TokensModal {
  String name;
  String value;
  String price;
  String percentage;

  TokensModal({required this.name, required this.value, required this.price, required this.percentage});
}
