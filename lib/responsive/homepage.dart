import 'package:expackpro/conatiner_view.dart';
import 'package:expackpro/responsive/details_page.dart';
import 'package:expackpro/responsive/place_model.dart';
import 'package:expackpro/responsive/responsive_widget.dart';
import 'package:flutter/material.dart';

import 'appdrawer.dart';
import 'gallery_view.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final ismobile = ResponsiveWidget.isMobile(context);
    return Scaffold(
      drawer: ismobile
          ? const Drawer(
              child: Appdrawer(),
            )
          : null,
      appBar: AppBar(
        title: Text("Tour App Ui"),
      ),
      body: ResponsiveWidget(
          mobile: buildMobile(),
          tablet: buildtablet(),
          desktop: buildDesktop()),
    );
  }
}

Widget buildMobile() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: GalleryView(),
  );
}

Widget buildtablet() {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Appdrawer(),
      ),
      Expanded(flex: 5, child: GalleryView())
    ],
  );
}

Widget buildDesktop() {
  return Row(
    children: [
      Expanded(child: Appdrawer()),
      Expanded(flex: 3, child: buildBody())
    ],
  );
}

Widget buildBody() => Container(
      color: Colors.grey.shade200,
      child: Column(
        children: [
          Expanded(
            child: GalleryView(),
          ),
          //  Expanded(child: placedetailspage(place: place))
        ],
      ),
    );
