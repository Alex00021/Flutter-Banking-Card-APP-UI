import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../data_json/balance_json.dart';
import '../my_theme/color.dart';
import 'card_page.dart';


class DashbaordPage extends StatefulWidget {
  const DashbaordPage({Key? key}) : super(key: key);

  @override
  State<DashbaordPage> createState() => _DashbaordPageState();
}

class _DashbaordPageState extends State<DashbaordPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }


  ///
  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      leading: IconButton(
          onPressed: () {
            ///TODO
          },
          icon: const CircleAvatar(
            backgroundImage: AssetImage(
                "assets/images/ling.jpeg"),
          )),
      actions: [IconButton(onPressed: () {}, icon: const Icon(AntDesign.search1))],
    );
  }

  Widget getBody() {
   
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.25,
          decoration: const BoxDecoration(color: primary),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 110,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(balanceLists.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: size.width * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      balanceLists[index]['currency'],
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: index == 0
                                              ? white
                                              : white.withOpacity(0.5),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    balanceLists[index]['amount'],
                                    style: TextStyle(
                                        fontSize: 35,
                                        color: index == 0
                                            ? white
                                            : white.withOpacity(0.5),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                balanceLists[index]['description'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: white.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: secondary.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              "Add money",
                              style: TextStyle(
                                  color: white, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: secondary.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              "Exchange",
                              style: TextStyle(
                                  color: white, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: getAccountSection(),
            ),
          ),
        ),
      ],
    );
  }

  Widget getAccountSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 40, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Accounts",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 10,
                  // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: secondary.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                              child: Icon(
                                AntDesign.wallet,
                                color: primary,
                                 size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "40000-888-5-7000-012345",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: primary,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Divider(
                      thickness: 0.2,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Icon(
                            MaterialIcons.euro_symbol,
                            color: primary,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "18 199.24 EUR",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Divider(
                      thickness: 0.2,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Icon(
                            MaterialCommunityIcons.currency_gbp,
                            color: primary,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "36.67 GBP",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Cards",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 90,
                height: 22,
                decoration: BoxDecoration(
                    color: secondary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Ionicons.ios_add,
                      size: 16,
                      color: primary,
                    ),
                    Text(
                      "ADD CARD",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: primary),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CardPage()));
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 10,
                    // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: secondary.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Icon(
                              AntDesign.creditcard,
                              color: primary,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "EUR *2330",
                          style: TextStyle(
                              fontSize: 15, ),
                        )
                      ],
                    ),
                    const Text(
                          "8 199.24 EUR",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
