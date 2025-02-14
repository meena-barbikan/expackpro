import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
// ignore: depend_on_referenced_packages
import 'package:iconsax/iconsax.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class ColorSwitcherScreen extends StatefulWidget {
  const ColorSwitcherScreen({super.key});

  @override
  _ColorSwitcherScreenState createState() => _ColorSwitcherScreenState();
}

class _ColorSwitcherScreenState extends State<ColorSwitcherScreen> {
  Color selectedColor = Colors.black; // Default color is black

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Switcher'),
        backgroundColor: selectedColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the selected color
          Container(
            height: 200,
            width: double.infinity,
            color: selectedColor,
            alignment: Alignment.center,
            child: const Text(
              'Selected Color',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          // Buttons for switching colors
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Black container
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.black;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.black,
                ),
              ),
              // Orange container
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.orange;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.orange,
                ),
              ),
              // Yellow container
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = Colors.yellow;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class SubscriptionView extends StatefulWidget {
//   final Function(String) changeLanguage;
//   const SubscriptionView({super.key, required this.changeLanguage});

//   @override
//   State<SubscriptionView> createState() => _SubscriptionViewState();
// }

// class _SubscriptionViewState extends State<SubscriptionView> {
//   int selectedindex = 0;
//   void updateindex(int index) {
//     setState(() {
//       selectedindex = index;
//     });
//   }

//   void _showLanguageDialog() {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.zero,
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(
//                   left: 15,
//                 ),
//                 height: 40,
//                 decoration: const BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(15),
//                         topRight: Radius.circular(15))),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Icon(Icons.g_translate_outlined, color: Colors.white),
//                     const Text(
//                       "Selected Lanuage",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                           fontFamily: "Poppins"),
//                     ),
//                     IconButton(
//                       icon: const Icon(
//                         Icons.clear,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     )
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     widget.changeLanguage("ta");
//                   });
//                   Navigator.pop(context);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     padding: const EdgeInsets.only(top: 5),
//                     height: 30,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         color: AppLocalizations.of(context)!.localeName == "ta"
//                             ? Colors.red
//                             : Colors.grey,
//                         borderRadius: BorderRadius.circular(12)),
//                     child: const Text(
//                       "தமிழ்",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontFamily: "Poppins",
//                           fontSize: 16,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     widget.changeLanguage("en");
//                   });
//                   Navigator.pop(context);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     height: 30,
//                     width: double.infinity,
//                     padding: const EdgeInsets.only(top: 5),
//                     decoration: BoxDecoration(
//                         color: AppLocalizations.of(context)!.localeName == "en"
//                             ? Colors.red
//                             : Colors.grey,
//                         borderRadius: BorderRadius.circular(12)),
//                     child: const Text(
//                       "English",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontFamily: "Poppins",
//                           fontSize: 16,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<String> titles = [
//       AppLocalizations.of(context)!.title0,
//       AppLocalizations.of(context)!.title1,
//       AppLocalizations.of(context)!.title2,
//       AppLocalizations.of(context)!.title3,
//       AppLocalizations.of(context)!.title4,
//       AppLocalizations.of(context)!.title5,
//       AppLocalizations.of(context)!.title6,
//       AppLocalizations.of(context)!.title7,
//     ];
//     List<String> titlefirstbox = [
//       AppLocalizations.of(context)!.titlefirstbox1,
//       AppLocalizations.of(context)!.titlefirstbox2,
//       AppLocalizations.of(context)!.titlefirstbox3,
//       AppLocalizations.of(context)!.titlefirstbox4,
//       AppLocalizations.of(context)!.titlefirstbox5,
//       AppLocalizations.of(context)!.titlefirstbox6,
//       AppLocalizations.of(context)!.titlefirstbox7,
//       AppLocalizations.of(context)!.titlefirstbox8,
//       AppLocalizations.of(context)!.titlefirstbox9,
//     ];
//     List<String> titlesecondbox = [
//       AppLocalizations.of(context)!.titlesecondbox0,
//       AppLocalizations.of(context)!.titlesecondbox2,
//       AppLocalizations.of(context)!.titlesecondbox3,
//       AppLocalizations.of(context)!.titlesecondbox4,
//       AppLocalizations.of(context)!.titlesecondbox5,
//       AppLocalizations.of(context)!.titlesecondbox6,
//       AppLocalizations.of(context)!.titlesecondbox7,
//       AppLocalizations.of(context)!.titlesecondbox8,
//       AppLocalizations.of(context)!.titlesecondbox9,
//       AppLocalizations.of(context)!.titlesecondbox10,
//       AppLocalizations.of(context)!.titlesecondbox11,
//     ];
//     List<String> selectedList = [];
//     if (selectedindex == 0) {
//       selectedList = titles;
//     } else if (selectedindex == 1) {
//       selectedList = titlefirstbox;
//     } else if (selectedindex == 2) {
//       selectedList = titlesecondbox;
//     }

//     selectedList.removeWhere((item) => item.isEmpty);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: const Icon(Icons.arrow_back, color: Colors.black),
//         title: Text(
//           AppLocalizations.of(context)!.homepage,
//           style: const TextStyle(color: Colors.black),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: IconButton(
//               onPressed: () {
//                 _showLanguageDialog();
//               },
//               icon: const Icon(
//                 Icons.g_translate_outlined,
//                 color: Colors.black,
//               ),
//             ),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           //crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 //margin: const EdgeInsets.all(20),
//                 padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
//                 decoration: const BoxDecoration(
//                   color: Color(0xffC4E1F6),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.all(10.0),
//                       child: const Text(
//                         "Your Lifestyle Your Plan Your Success",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: "Poppins"),
//                       ),
//                     ),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       primary: false,
//                       itemCount: selectedList.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 4.0),
//                           child: Row(
//                             children: [
//                               const Icon(
//                                 Icons.check,
//                                 size: 16,
//                                 color: Colors.black,
//                               ),
//                               const SizedBox(width: 10),
//                               Expanded(
//                                 child: Padding(
//                                   padding: AppLocalizations.of(context)!
//                                               .localeName ==
//                                           "ta"
//                                       ? const EdgeInsets.only(top: 10)
//                                       : EdgeInsets.zero,
//                                   child: Text(
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 3,
//                                     selectedList[index],
//                                     style: const TextStyle(
//                                         fontSize: 16,
//                                         color: Colors.black,
//                                         fontFamily: "Poppins"),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, right: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ClickableContainer(
//                     title: "1 year",
//                     subtitle: "₹ 999",
//                     planname: "Standard Plan",
//                     onTap: () {
//                       updateindex(0);
//                       // Update list and set selected index
//                     },
//                     isSelected: selectedindex == 0,
//                   ),
//                   ClickableContainer(
//                     title: "1 year",
//                     subtitle: "₹ 1300",
//                     planname: "Gold Plan",
//                     onTap: () {
//                       updateindex(1);
//                       // Update list and set selected index
//                     },
//                     isSelected: selectedindex == 1,
//                   ),
//                   ClickableContainer(
//                       title: "1 year",
//                       subtitle: "₹ 2999",
//                       planname: "VIP Plan",
//                       onTap: () {
//                         updateindex(2);
//                         // Update list and set selected index
//                       },
//                       isSelected: selectedindex == 2),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 150,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     AppLocalizations.of(context)!.heading,
//                     style: const TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20),
//                   ),
//                   Text(
//                     AppLocalizations.of(context)!.subheading,
//                     style: const TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20),
//                   ),
//                   const Spacer(),
//                   Container(
//                     padding: const EdgeInsets.only(top: 10),
//                     height: 50,
//                     width: AppLocalizations.of(context)!.localeName == "en"
//                         ? 150
//                         : 200,
//                     decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(15)),
//                     child: Text(
//                       textAlign: TextAlign.center,
//                       AppLocalizations.of(context)!.buttontext,
//                       style: const TextStyle(color: Colors.white, fontSize: 20),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class ClickableContainer extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final void Function()? onTap;
  final String? planname;
  final bool isSelected; // New parameter to handle selected state

  const ClickableContainer({
    Key? key,
    this.title,
    this.subtitle,
    this.onTap,
    this.planname,
    required this.isSelected, // Receive the selected state
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 105,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: isSelected
                    ? Colors.red
                    : Colors.grey, // Change border color based on selection
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title ?? "",
                    style: const TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  Text(
                    subtitle ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            child: Container(
              height: 20,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.orange),
              child: Text(
                textAlign: TextAlign.center,
                planname ?? "",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
