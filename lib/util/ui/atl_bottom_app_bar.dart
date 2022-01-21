import 'package:flutter/material.dart';
import 'package:flutter_practice_test/util/ui/alt_gradiant_widget.dart';
import '/util/constants/ui_constants.dart';
import '/util/ui/atl_text.dart';

class ATLBottomAppBar extends StatefulWidget {
  final List<Widget>? pages;

  const ATLBottomAppBar({
    Key? key,
    @required this.pages,
  }) : super(key: key);

  @override
  ATLBottomAppBarState createState() => ATLBottomAppBarState();
}

class ATLBottomAppBarState extends State<ATLBottomAppBar> {
  int currentTab = ATLUIConstants.dfltZero;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget? currentScreen;

  List<String> pageNames = ["Home", "Swap", "Transaction", "Settings"];

  @override
  void initState() {
    currentScreen = widget.pages?.elementAt(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return bottomAppBar();
  }

  Widget bottomAppBar() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: PageStorage(
        child: currentScreen ?? const ATLText(txt: ""),
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black87,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: ATLUIConstants.btnBarHgt,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / (widget.pages?.length ?? 4),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      currentScreen = widget.pages?.elementAt(ATLUIConstants.dfltZero);
                      currentTab = ATLUIConstants.dfltZero;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      (currentTab == ATLUIConstants.dfltZero)
                          ? const ATLGradintWidget(child: Icon(Icons.home))
                          : const Icon(
                              Icons.home,
                            ),
                      (currentTab == ATLUIConstants.dfltZero)
                          ? ATLGradintWidget(
                              child: ATLText(
                                txt: pageNames.elementAt(ATLUIConstants.dfltZero),
                                fontSize: ATLUIConstants.priFontSize,
                              ),
                            )
                          : ATLText(
                              txt: pageNames.elementAt(ATLUIConstants.dfltZero),
                              fontSize: ATLUIConstants.priFontSize,
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / (widget.pages?.length ?? 4),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      currentScreen = widget.pages?.elementAt(ATLUIConstants.dfltOne);
                      currentTab = ATLUIConstants.dfltOne;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      (currentTab == ATLUIConstants.dfltOne)
                          ? const ATLGradintWidget(child: Icon(Icons.switch_account_sharp))
                          : const Icon(
                              Icons.switch_account_sharp,
                            ),
                      (currentTab == ATLUIConstants.dfltOne)
                          ? ATLGradintWidget(
                              child: ATLText(
                                txt: pageNames.elementAt(ATLUIConstants.dfltOne),
                                fontSize: ATLUIConstants.priFontSize,
                              ),
                            )
                          : ATLText(
                              txt: pageNames.elementAt(ATLUIConstants.dfltOne),
                              fontSize: ATLUIConstants.priFontSize,
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / (widget.pages?.length ?? 4),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      currentScreen = widget.pages?.elementAt(ATLUIConstants.dfltTwo);
                      currentTab = ATLUIConstants.dfltTwo;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      (currentTab == ATLUIConstants.dfltTwo)
                          ? const ATLGradintWidget(child: Icon(Icons.transform))
                          : const Icon(
                              Icons.transform,
                            ),
                      (currentTab == ATLUIConstants.dfltTwo)
                          ? ATLGradintWidget(
                              child: ATLText(
                                txt: pageNames.elementAt(ATLUIConstants.dfltTwo),
                                fontSize: ATLUIConstants.priFontSize,
                              ),
                            )
                          : ATLText(
                              txt: pageNames.elementAt(ATLUIConstants.dfltTwo),
                              fontSize: ATLUIConstants.priFontSize,
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / (widget.pages?.length ?? 4),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      currentScreen = widget.pages?.elementAt(ATLUIConstants.dfltThree);
                      currentTab = ATLUIConstants.dfltThree;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      (currentTab == ATLUIConstants.dfltThree)
                          ? const ATLGradintWidget(child: Icon(Icons.settings))
                          : const Icon(
                              Icons.settings,
                            ),
                      (currentTab == ATLUIConstants.dfltThree)
                          ? ATLGradintWidget(
                              child: ATLText(
                                txt: pageNames.elementAt(ATLUIConstants.dfltThree),
                                fontSize: ATLUIConstants.priFontSize,
                              ),
                            )
                          : ATLText(
                              txt: pageNames.elementAt(ATLUIConstants.dfltThree),
                              fontSize: ATLUIConstants.priFontSize,
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
