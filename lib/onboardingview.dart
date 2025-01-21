// ignore_for_file: camel_case_types

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingview extends StatefulWidget {
  const Onboardingview({super.key});

  @override
  State<Onboardingview> createState() => _OnboardingviewState();
}

class _OnboardingviewState extends State<Onboardingview> {
  static final PageController _pagecontroller = PageController(initialPage: 0);

  List<Widget> onbordingPages = [
    onboardCard(
      image:
          "https://th.bing.com/th/id/OIP.6hiu8EE-GqXFn-TZTrHVaQHaB3?w=345&h=88&c=7&r=0&o=5&dpr=1.3&pid=1.7",
      title: "Welcome to !..",
      subtitle: "Loream 123 456 Description",
      buttontext: "Next",
      onPressed: () {
        _pagecontroller.animateToPage(1,
            duration: const Duration(seconds: 1), curve: Curves.linear);
      },
    ),
    onboardCard(
        image:
            "https://th.bing.com/th/id/OIP.sB9JzkQU_tfL4B2eM6IckwHaDM?w=321&h=150&c=7&r=0&o=5&dpr=1.3&pid=1.7",
        title: "Create an Account Choose A Course",
        subtitle: "Loream 123 456 Description",
        buttontext: "Next",
        onPressed: () {
          log("second page move 1");
          _pagecontroller.animateToPage(2,
              duration: const Duration(seconds: 1), curve: Curves.linear);
        }),
    onboardCard(
        image:
            "https://th.bing.com/th/id/OIP.3VJfcIvr20Nc2DxrdY_qAgHaEY?w=276&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
        title: "Welcome",
        subtitle: "Loream 123 456 Description",
        buttontext: "Next",
        onPressed: () {
          // _pagecontroller.animateToPage(3,
          //     duration: Duration(seconds: 1), curve: Curves.linear);
        })
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: PageView(
            controller: _pagecontroller,
            children: onbordingPages,
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SmoothPageIndicator(
                controller: _pagecontroller, count: onbordingPages.length),
          ),
        ],
      ),
    );
  }
}

class onboardCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String buttontext;
  final Function onPressed;
  const onboardCard(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.buttontext,
      required this.onPressed});

  @override
  State<onboardCard> createState() => _onboardCardState();
}

class _onboardCardState extends State<onboardCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Image(height: 200, image: NetworkImage(widget.image)),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.blue[900],
              fontSize: 25,
            ),
          ),
          Text(
            widget.subtitle,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          MaterialButton(
            minWidth: 200,
            color: Colors.blue,
            onPressed: () {
              widget.onPressed();
              log("button clicked");
            },
            child: Text(widget.buttontext),
          ),
        ],
      ),
    );
  }
}
