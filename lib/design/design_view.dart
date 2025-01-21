import 'dart:developer';
import 'dart:ui';

import 'package:expackpro/conatiner_view.dart';
import 'package:expackpro/exflchart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DesignView extends StatefulWidget {
  const DesignView({super.key});

  @override
  State<DesignView> createState() => _DesignViewState();
}

class _DesignViewState extends State<DesignView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 182, 223, 213),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Text(
              "Hello",
              style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
            ),
            const SizedBox(
              height: 02,
            ),
            const Text(
              "Nishar",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Container(
                    height: 160,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 111, 174, 167),
                        borderRadius: BorderRadius.circular(14)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          child: Row(
                            children: [
                              Icon(
                                Icons.wallet_outlined,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Subscription's Wallet",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                              Spacer(),
                              Icon(Icons.cloud_circle_outlined),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "324.25 ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              Text(
                                "Monthly expenses 69",
                                style: TextStyle(color: Colors.black45),
                              ),
                              const Spacer(),
                              const Icon(Icons.remove_red_eye_outlined)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Color.fromARGB(255, 111, 174, 167),
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add funds",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Spacer(),
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Color.fromARGB(255, 111, 174, 167),
                            child: Icon(
                              Icons.map_rounded,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "withdraw",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Today",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                      child: const Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 111, 174, 167),
                            radius: 20,
                            child: Icon(Icons.shopping_bag),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nike Store",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "Transport",
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "-743.00",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "Tax - 54.3",
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 109, 184, 175),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: GNav(
            backgroundColor: Colors.transparent,
            tabBackgroundColor: Colors.black,
            padding: const EdgeInsets.all(10),
            tabs: [
              const GButton(
                icon: Icons.query_builder_outlined,
                iconActiveColor: Colors.white,
                text: "Discover",
                textStyle: TextStyle(fontSize: 15, color: Colors.white),
              ),
              GButton(
                iconActiveColor: Colors.white,
                textStyle: const TextStyle(fontSize: 15, color: Colors.white),
                icon: Icons.local_fire_department_outlined,
                text: "Local",
                textColor: Colors.grey.shade100,
              ),
              GButton(
                iconActiveColor: Colors.white,
                textStyle: const TextStyle(fontSize: 15, color: Colors.white),
                icon: Icons.chat_outlined,
                text: "Message",
                textColor: Colors.grey.shade100,
              ),
              GButton(
                iconActiveColor: Colors.white,
                textStyle: const TextStyle(fontSize: 15, color: Colors.white),
                icon: Icons.person,
                text: "person",
                textColor: Colors.grey.shade100,
              ),
            ]),
      ),
    );
  }
}

class countpage extends StatefulWidget {
  const countpage({super.key});

  @override
  State<countpage> createState() => _countpageState();
}

class _countpageState extends State<countpage> {
  int indexvar = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          decoration: const BoxDecoration(
              color: const Color.fromARGB(255, 202, 247, 236),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "-734.00",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Food & Drunk",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      decoration: TextDecoration.none),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Tax : 60.0",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 13,
                      decoration: TextDecoration.none),
                ),
              ),
              const SizedBox(
                height: 05,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "April 2023",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 11,
                      decoration: TextDecoration.none),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: double.infinity,
                //padding: const EdgeInsets.all(10),
                child: BarChart(
                  BarChartData(
                      barTouchData: BarTouchData(enabled: false),
                      //backgroundColor: Colors.amber,
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 20,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 0:
                                return const Text(
                                  "Aug",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black45,
                                      fontSize: 22),
                                );
                              case 1:
                                return const Text(
                                  "oct",
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black45,
                                      fontSize: 22),
                                );
                              case 2:
                                return const Text(
                                  "Dec",
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black45,
                                      fontSize: 22),
                                );

                              case 3:
                                return const Text(
                                  "Feb",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black45,
                                      fontSize: 22),
                                );
                              case 4:
                                return const Text(
                                  "Apr",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black45,
                                      fontSize: 22),
                                );

                              default:
                                return const Text("");
                            }
                          },
                        )),
                      ),
                      borderData: FlBorderData(show: false),
                      gridData: const FlGridData(show: false),
                      barGroups: _createStackedBarGroups(),
                      groupsSpace: 00),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              indexvar = index;
                            });
                            log("message");
                          },
                          child: Container(
                            height: 45,
                            width: 140,
                            padding: const EdgeInsets.only(top: 15),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: index == indexvar
                                    ? Colors.black
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: index == indexvar
                                        ? Colors.black
                                        : Colors.grey)),
                            child: Text(
                              "Drink & Food",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.none,
                                color: index == indexvar
                                    ? Colors.white
                                    : const Color.fromARGB(255, 124, 212, 190),
                              ),
                            ),
                          ),
                        );
                      })),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.black87),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today",
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 20,
                            decoration: TextDecoration.none),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 193,
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 80,
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 68, 100, 97),
                                    borderRadius: BorderRadius.circular(17)),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundColor:
                                          Color.fromARGB(255, 152, 234, 214),
                                      child: Icon(
                                        Icons.shopping_bag_rounded,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Nike Store",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Transport",
                                              style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 20,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "-743.00",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Tax - 54.3",
                                              style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 20,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

List<BarChartGroupData> _createStackedBarGroups() {
  return [
    BarChartGroupData(
      x: 0,
      // barsSpace: 0,
      barRods: [
        BarChartRodData(
          //backDrawRodData: BackgroundBarChartRodData(color: Colors.grey),
          toY: 1,
          color: const Color.fromARGB(255, 117, 186, 169),
          width: 30,
          borderRadius: BorderRadius.circular(06),
        ),
        BarChartRodData(
          toY: 1.5,
          color: const Color.fromARGB(255, 117, 186, 169),
          width: 30,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    ),
    BarChartGroupData(
      x: 1,
      // barsSpace: 0,
      barRods: [
        BarChartRodData(
          toY: 1.6,
          color: const Color.fromARGB(255, 117, 186, 169),
          width: 30,
          borderRadius: BorderRadius.circular(6),
        ),
        BarChartRodData(
          toY: 1.2,
          color: const Color.fromARGB(255, 117, 186, 169),
          width: 30,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    ),
    BarChartGroupData(
      // barsSpace: 0,
      x: 2,
      barRods: [
        BarChartRodData(
          toY: 2.0,
          color: const Color.fromARGB(255, 117, 186, 169),
          width: 30,
          borderRadius: BorderRadius.circular(6),
        ),
        BarChartRodData(
          toY: 1,
          color: const Color.fromARGB(255, 117, 186, 169),
          width: 30,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    ),
    BarChartGroupData(
      x: 3,
      // barsSpace: 0,
      barRods: [
        BarChartRodData(
          toY: 1.5,
          color: const Color.fromARGB(255, 117, 186, 169),
          width: 30,
          borderRadius: BorderRadius.circular(6),
        ),
        BarChartRodData(
          toY: 2.5,
          color: const Color.fromARGB(255, 117, 186, 169),
          width: 30,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    ),
    BarChartGroupData(
      x: 4,
      // barsSpace: 0,
      barRods: [
        BarChartRodData(
          toY: 1,
          color: const Color.fromARGB(255, 86, 148, 132),
          width: 30,
          borderRadius: BorderRadius.circular(6),
        ),
        // BarChartRodData(
        //   toY: 14,
        //   color: Color.fromARGB(255, 83, 140, 126),
        //   width: 20,
        //   borderRadius: BorderRadius.circular(4),
        // ),
      ],
    ),
  ];
}

class cookiedeign extends StatefulWidget {
  const cookiedeign({super.key});

  @override
  State<cookiedeign> createState() => _cookiedeignState();
}

class _cookiedeignState extends State<cookiedeign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff363841),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
                color: Color(0xff000000),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          ),
          const Positioned(
              top: -20,
              left: 70,
              //bottom: 00,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                      backgroundColor: Color(
                        0xff363841,
                      ),
                      radius: 20,
                      child: Icon(
                        Icons.home,
                        size: 20,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.amber),
                  )
                ],
              )),
          const Positioned(
              top: -20,
              left: 150,
              // bottom: 40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                      backgroundColor: Color(
                        0xff363841,
                      ),
                      radius: 20,
                      child: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )),
          const Positioned(
              top: -20,
              left: 220,
              // bottom: 40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                      backgroundColor: Color(
                        0xff363841,
                      ),
                      radius: 20,
                      child: Icon(
                        Icons.redeem,
                        size: 20,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Premium",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ))
        ],
      ),
      body: ListView(
        //padding: const EdgeInsets.all(15),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: SizedBox(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  const SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "James",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          "Figueraaa",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const containerwidget(
                    icon: Icons.shopping_bag_outlined,
                    text: '6',
                    subtext: 'Products',
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: const SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Cookies",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 44,
                      height: 1.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Premium",
                        style: TextStyle(
                          color: Color(0xffE38035),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 1.0,
                        ),
                      ),
                      //  Spacer(),
                      Text(
                        "see more",
                        style: TextStyle(
                            color: Color(0xffE38035),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 320,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                primary: false,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 120, left: 15, right: 20),
                        child: Container(
                          height: 185,
                          width: 165,
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                colors: [
                                  const Color.fromARGB(255, 167, 170, 184)
                                      .withOpacity(0.3),
                                  Colors.white.withOpacity(0.1),
                                ]),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(90)),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Chocolate \nChips",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                child: Row(
                                  children: [
                                    ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                            Color(0xffE38035),
                                            BlendMode.srcATop),
                                        child: Image(
                                            height: 20,
                                            image: AssetImage(
                                                "assets/queen.png"))),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "PREMIUM",
                                      style: TextStyle(
                                          color: Color(0xffE38035),
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "20 USD",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                          top: -20,
                          left: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 100,
                            backgroundImage: AssetImage("assets/cookie.png"),
                          )),
                      const Positioned(
                        bottom: 25,
                        right: 30,
                        // right: 40,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xff000000),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: SizedBox(
              child: Row(
                children: [
                  Text(
                    "Offers",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                  Spacer(),
                  Text(
                    "seeMore",
                    style: TextStyle(
                        color: Color(0xffE38035),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(70)),
                  color:
                      const Color.fromARGB(255, 167, 170, 184).withOpacity(0.3),
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/cokkie.png")
                        //  NetworkImage(
                        //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW9T7eSFx-3W62UuuvNFgMsffJlp1fyg4sOw&s"),
                        ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Double",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 26),
                          ),
                          Row(
                            children: [
                              Text(
                                "Chocalate",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                width: 70,
                              ),
                              Text(
                                "20 USD",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    decoration: TextDecoration.lineThrough),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                      Color(0xffE38035), BlendMode.srcATop),
                                  child: Image(
                                      height: 20,
                                      image: AssetImage("assets/queen.png"))),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "PREMIUM",
                                style: TextStyle(
                                    color: Color(0xffE38035),
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "12 USD",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 20,
              right: 10,
              // right: 40,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xff000000),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}

class containerwidget extends StatelessWidget {
  final String text;
  final String subtext;
  final IconData icon;
  const containerwidget(
      {super.key,
      required this.text,
      required this.subtext,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtext,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
      Positioned(
          top: 00,
          left: 30,
          // right: 40,
          child: Badge(
            backgroundColor: Colors.orange,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xff000000),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ))
    ]);
  }
}

class cokkiedashboarddesign extends StatefulWidget {
  const cokkiedashboarddesign({super.key});

  @override
  State<cokkiedashboarddesign> createState() => _cokkiedashboarddesignState();
}

class _cokkiedashboarddesignState extends State<cokkiedashboarddesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: const NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd3hO9U8agyvJdzdYkICcJvJGcea6ZIXU_sA&s",
                ),
                fit: BoxFit.fill, // Covers the entire screen
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.arrow_back),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: containerwidget(
                              icon: Icons.shopping_bag,
                              text: '6',
                              subtext: 'Products',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        children: [
                          ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  Color(0xffE38035), BlendMode.srcATop),
                              child: Image(
                                  height: 20,
                                  image: AssetImage("assets/queen.png"))),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "PREMIUM",
                            style: TextStyle(
                                color: Color(0xffE38035), fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "CooKies",
                                style: TextStyle(
                                    color: Colors.white,
                                    height: 00,
                                    fontSize: 100),
                              ),
                              Text(
                                "Choco chips",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 177, 174, 174),
                                    height: 00,
                                    fontSize: 30),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                width: 160,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 177, 174, 174),
                                    ),
                                    borderRadius: BorderRadius.circular(25)),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.auto_stories_outlined,
                                      color: Color.fromARGB(255, 177, 174, 174),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "information",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 177, 174, 174),
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 4.5,
                                      backgroundColor: Color(0xffE38035),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Select Quantity",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ])),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    SizedBox(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  // end: Alignment.topCenter,
                                  colors: [
                                    Colors.black,
                                    Colors.white24,
                                  ]),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),
                                  topRight: Radius.circular(260)),
                            ),
                            child: const Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 50),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "20",
                                        style: TextStyle(
                                            height: 00,
                                            color: Colors.white,
                                            fontSize: 59),
                                      ),
                                      const SizedBox(
                                        width: 02,
                                      ),
                                      Column(
                                        children: [
                                          Baseline(
                                            baseline:
                                                BorderSide.strokeAlignCenter,
                                            baselineType:
                                                TextBaseline.alphabetic,
                                            child: Text(
                                              "USD",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          Baseline(
                                            baseline:
                                                BorderSide.strokeAlignCenter,
                                            baselineType:
                                                TextBaseline.alphabetic,
                                            child: Text(
                                              ".80",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 70),
                                  child: Text(
                                    "24 Units",
                                    style: TextStyle(
                                        height: 00,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 70),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 4.5,
                                        backgroundColor: Color(0xffE38035),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Cookies",
                                        style:
                                            TextStyle(color: Color(0xffE38035)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20, bottom: 40),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              height: 130,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Icon(
                                      Icons.view_in_ar_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 4.5,
                                    backgroundColor: Color(0xffE38035),
                                  ),
                                  Text(
                                    "Add to \nOrder",
                                    style: TextStyle(
                                        height: 00,
                                        color: Colors.black,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
            //   ],
            // )),
            ));
  }
}
