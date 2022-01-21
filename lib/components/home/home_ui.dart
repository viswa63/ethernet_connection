import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/util/ui/alt_gradiant_widget.dart';
import '/util/ui/atl_button.dart';
import '/components/home/home_modal.dart';
import '/components/home/home_service.dart';
import '/util/ui/atl_avatar.dart';
import '/util/ui/atl_text.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> with SingleTickerProviderStateMixin {
  HomeService service = HomeService();

  @override
  void initState() {
    service.modal.controller = TabController(vsync: this, length: 2);
    service.modal.controller.addListener(_setActiveTabIndex);
    service.modal.netConnection.tokensList.add(TokensModal(name: "1INCH Token", value: "10.059 1INCH", price: "\$3,77", percentage: "+3.22%"));
    service.modal.netConnection.tokensList.add(TokensModal(name: "APV GOVERNER Token", value: "9,999.32 APY", price: "\$2,35", percentage: "-0.42%"));
    service.modal.netConnection.tokensList.add(TokensModal(name: "Basic Attention Token", value: "10.059 1INCH", price: "\$0.66", percentage: "+0.44%"));
    // ATLHttpService.postCallWithOutAuth();
    super.initState();
  }

  void _setActiveTabIndex() {
    setState(() {
      service.modal.activeTabIndex = service.modal.controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.only(left: 5.0, top: 10, right: 5.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                profileBar(),
                profileValue(),
                navigationIcons(),
                tabs(),
                const ATLButton(
                  btnText: "Add Token",
                  icon: Icons.add_circle_outline,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: const ATLAvatar(
          avtrType: "IMAGE",
          avtrUrl: "assets/images/profile_image.jpg",
          icon: Icons.person,
        ),
        title: Row(
          children: [
            ATLText(txt: service.modal.firstName),
            const SizedBox(
              width: 5,
            ),
            ATLGradintWidget(
                child: IconButton(
                    splashRadius: 2,
                    onPressed: () {
                      profileSheet();
                    },
                    icon: const Icon(Icons.keyboard_arrow_down))),
          ],
        ), //  service.modal.firstName
        subtitle: Row(
          children: [
            Container(
              child: const ATLText(txt: " "),
              color: Colors.blue,
              height: 5,
            ),
            const SizedBox(
              width: 5,
            ),
            ATLText(
              txt: service.modal.netConnection.networkType,
              fontSize: 10,
            ),
          ],
        ),
        trailing: const Icon(
          Icons.document_scanner,
          size: 25,
        ),
      ),
    );
  }

  Widget profileValue() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Column(
          children: [
            ATLText(
              txt: service.modal.netConnection.ethValue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ATLText(
                  txt: service.modal.netConnection.ethPrice.toString(),
                ),
                const SizedBox(
                  width: 5,
                ),
                ATLText(
                  txt: service.modal.netConnection.ethPercentage,
                  color: (service.modal.netConnection.ethPercentage.startsWith("+")) ? Colors.green : Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget navigationIcons() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: const [
              ATLAvatar(
                avtrType: "ICON",
                icon: Icons.send,
              ),
              ATLGradintWidget(
                child: ATLText(
                  txt: "Send",
                ),
              ),
            ],
          ),
          Column(
            children: const [
              ATLAvatar(
                avtrType: "ICON",
                icon: Icons.receipt_long_sharp,
              ),
              ATLGradintWidget(
                child: ATLText(
                  txt: "Receive",
                ),
              ),
            ],
          ),
          Column(
            children: const [
              ATLAvatar(
                avtrType: "ICON",
                icon: Icons.balcony_outlined,
              ),
              ATLGradintWidget(
                child: ATLText(
                  txt: "Buy Eth",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget tabs() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TabBar(
              controller: service.modal.controller,
              indicatorColor: Colors.orange,
              unselectedLabelColor: Colors.white24,
              labelColor: Colors.white,
              tabs: const [
                Tab(
                  text: "Tokens",
                ),
                Tab(
                  text: "Collectibles",
                ),
              ],
            ),
            Container(
              height: 250,
              decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
              child: TabBarView(
                controller: service.modal.controller,
                children: [
                  tokensContent(),
                  const Center(
                    child: ATLText(txt: "Coming Soon..."),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tokensContent() {
    return Column(
      children: List.generate(
        service.modal.netConnection.tokensList.length,
        (index) => ListTile(
          leading: ATLAvatar(
            avtrType: "ICON",
            icon: service.modal.tokenIcons.elementAt(index),
          ),
          title: ATLText(txt: service.modal.netConnection.tokensList.elementAt(index).name), //  service.modal.firstName
          subtitle: Row(
            children: [
              ATLText(
                txt: service.modal.netConnection.tokensList.elementAt(index).price,
                fontSize: 10,
              ),
              const SizedBox(
                width: 5,
              ),
              ATLText(
                txt: service.modal.netConnection.tokensList.elementAt(index).percentage,
                fontSize: 10,
                color: (service.modal.netConnection.tokensList.elementAt(index).percentage.startsWith("+")) ? Colors.green : Colors.red,
              ),
            ],
          ),
          trailing: ATLText(
            txt: service.modal.netConnection.tokensList.elementAt(index).value,
            // fontSize: 10,
          ),
        ),
      ),
    );
  }

  void profileSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      // constraints: BoxConstraints(maxWidth: localwidth),
      builder: (BuildContext context) {
        double? height;
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            height: height,
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: Colors.black54,
            ),
            child: StatefulBuilder(builder: (context, setStater) {
              return SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                      width: 300,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white,
                                  ),
                                )),
                            (!service.modal.isNetworkSheet) ? accountWidget(setStater) : networkWidget(setStater)
                          ],
                        ),
                      )));
            }),
          );
        });
      },
    );
  }

  Widget accountWidget(StateSetter stateSetter) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(padding: const EdgeInsets.symmetric(vertical: 10), child: const ATLText(txt: "Account")),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  child: const ATLText(txt: " "),
                  color: Colors.blue,
                  height: 5,
                ),
                const SizedBox(
                  width: 5,
                ),
                ATLText(txt: service.modal.netConnection.networkType),
                ATLGradintWidget(
                    child: IconButton(
                        splashRadius: 2,
                        onPressed: () {
                          stateSetter(() {
                            service.modal.isNetworkSheet = true;
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_down))),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const ATLAvatar(
              avtrType: "IMAGE",
              avtrUrl: "assets/images/profile_image.jpg",
            ),
            title: Row(
              children: [
                ATLText(txt: service.modal.firstName),
              ],
            ),
            trailing: const Icon(
              Icons.check_circle_outline_outlined,
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: const ATLAvatar(
              avtrType: "IMAGE",
              avtrUrl: "assets/images/flutter_logo.jpg",
            ),
            title: ATLText(txt: service.modal.lastName),
          ),
          const ListTile(
            leading: ATLAvatar(
              avtrType: "IMAGE",
              avtrUrl: "assets/images/dart_logo.png",
            ),
            title: ATLText(txt: "FMingato"),
          ),
          const SizedBox(
            height: 30,
          ),
          const ATLButton(btnText: "Create New Account"),
          const SizedBox(
            height: 10,
          ),
          const ATLButton(btnText: "Import Account"),
        ],
      ),
    );
  }

  Widget networkWidget(StateSetter stateSetter) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                  left: 0,
                  child: IconButton(
                      splashRadius: 2,
                      onPressed: () {
                        stateSetter(() {
                          service.modal.isNetworkSheet = false;
                        });
                      },
                      icon: const Icon(Icons.chevron_left))),
              Container(alignment: Alignment.center, padding: const EdgeInsets.symmetric(vertical: 10), child: const ATLText(txt: "Network")),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  child: const ATLText(txt: " "),
                  color: Colors.blue,
                  height: 5,
                ),
                const SizedBox(
                  width: 5,
                ),
                ATLText(txt: service.modal.netConnection.networkType),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: const ATLText(
              txt: "Other Networks",
              color: Colors.white38,
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  child: const ATLText(txt: " "),
                  color: Colors.green,
                  height: 5,
                ),
                const SizedBox(
                  width: 5,
                ),
                const ATLText(txt: "Ropsten Test Network"),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  child: const ATLText(txt: " "),
                  color: Colors.yellow,
                  height: 5,
                ),
                const SizedBox(
                  width: 5,
                ),
                const ATLText(txt: "Kovan Test Network"),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  child: const ATLText(txt: " "),
                  color: Colors.red,
                  height: 5,
                ),
                const SizedBox(
                  width: 5,
                ),
                const ATLText(txt: "Rinkeby Test Network"),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  child: const ATLText(txt: " "),
                  color: Colors.indigo.shade300,
                  height: 5,
                ),
                const SizedBox(
                  width: 5,
                ),
                const ATLText(txt: "Goerli Test Network"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
