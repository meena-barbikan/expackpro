// ignore_for_file: camel_case_types

import 'package:expackpro/scrollitems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class ScrollListanimation extends StatefulWidget {
  const ScrollListanimation({super.key});

  @override
  State<ScrollListanimation> createState() => _ScrollListanimationState();
}

class _ScrollListanimationState extends State<ScrollListanimation> {
  List<Widget> myItems = [];
  double mytopContainer = 0;
  bool closecontainer = false;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    mybodyItems();
    _controller.addListener(() {
      double mydata = _controller.offset / 120;
      setState(() {
        mytopContainer = mydata;
        closecontainer = _controller.offset > 50;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedOpacity(
                opacity: closecontainer ? 0 : 1,
                duration: const Duration(milliseconds: 500),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: closecontainer ? 0 : size.height * 0.31,
                  alignment: Alignment.topCenter,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discover",
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 20),
                              ),
                              Row(
                                // Replace ListTile with a simple Row
                                children: [
                                  Text(
                                    "View all",
                                    style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 17),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.grey.shade300,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              children: [
                                Containerwidget(
                                  size,
                                  Colors.orange,
                                  "Most \nFavorite",
                                  "20 items",
                                ),
                                Containerwidget(
                                  size,
                                  Colors.blue,
                                  "Newest",
                                  "20 items",
                                ),
                                Containerwidget(
                                  size,
                                  Colors.blueAccent,
                                  "Super \nSavings",
                                  "20 items",
                                ),
                                Containerwidget(
                                  size,
                                  Colors.blue,
                                  "Most \nFavorite",
                                  "20 items",
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "My coupons",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                  child: SizedBox(
                height: 1000,
                child: ListView.builder(
                  controller: _controller,
                  itemCount: myItems.length,
                  itemBuilder: (context, index) {
                    double opacity = 1.0;
                    if (mytopContainer > 0.5) {
                      opacity = index + 0.5 - mytopContainer;
                      if (opacity < 0) {
                        opacity = 0;
                      } else if (opacity > 1) {
                        opacity = 1;
                      }
                    }

                    return Opacity(
                      opacity: opacity,
                      child: Transform(
                        transform: Matrix4.identity()..scale(opacity, opacity),
                        alignment: Alignment.topCenter,
                        child: Align(
                          heightFactor: 0.7,
                          child: myItems[index],
                        ),
                      ),
                    );
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void mybodyItems() {
    // ignore: non_constant_identifier_names
    List<Widget> ListItems = [];
    for (Scrollitems items in dataItems) {
      ListItems.add(Container(
        height: 160,
        decoration: BoxDecoration(color: Color(items.color), boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 05,
          ),
        ]),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              items.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            Image.network(
              items.image,
              fit: BoxFit.cover,
            )
          ],
        ),
      ));
    }
    setState(() {
      myItems = ListItems;
    });
  }

  // ignore: non_constant_identifier_names
  Container Containerwidget(
    Size size,
    Color color,
    text,
    items,
  ) {
    return Container(
      height: size.height * 0.25,
      width: 170,
      margin: const EdgeInsets.only(right: 10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              items,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.favorite_outline),
            ),
          ],
        ),
      ),
    );
  }
}

class animatedview extends StatefulWidget {
  const animatedview({super.key});

  @override
  State<animatedview> createState() => _animatedviewState();
}

class _animatedviewState extends State<animatedview> {
  bool isexpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 300, left: 140),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isexpanded = !isexpanded;
              });
            },
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 55,
                width: isexpanded ? 150 : 70,
                decoration: BoxDecoration(
                    color: isexpanded ? Colors.green : Colors.deepPurple,
                    borderRadius: isexpanded
                        ? BorderRadius.circular(35)
                        : BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isexpanded)
                      const SizedBox(
                        width: 10,
                      ),
                    Center(
                      child: Icon(
                        isexpanded ? Icons.check : Icons.shopping_cart_outlined,
                        size: 30,
                      ),
                    ),
                    if (isexpanded)
                      const Expanded(child: Text("Add to Your Card"))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

// class panitview extends StatefulWidget {
//   const panitview({super.key});

//   @override
//   State<panitview> createState() => _panitviewState();
// }

// class _panitviewState extends State<panitview> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Column(
//         children: [
//           CustomPaint(
//             painter: Arcpaniter(),
//             child: SizedBox(
//               height: size.height,
//               width: size.width,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class Arcpaniter extends CustomPaint {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path orangeArc = Path()
//       ..moveTo(0, 0)
//       ..lineTo(0, size.height - 175)
//       ..quadraticBezierTo(
//           size.width / 2, size.height, size.height, size.width - 175)
//       ..lineTo(
//         size.height,
//         size.width,
//       )
//       ..lineTo(size.width, 0)
//       ..close();
//     canvas.drawPath(orangeArc, Paint()..color = Colors.orange);

//     Path whiteArc = Path()
//       ..moveTo(0, 0)
//       ..lineTo(0, size.height - 180)
//       ..quadraticBezierTo(
//           size.width / 2, size.height - 60, size.height, size.width - 180)
//       ..lineTo(
//         size.height,
//         size.width,
//       )
//       ..lineTo(size.width, 0)
//       ..close();
//     canvas.drawPath(
//         whiteArc, Paint()..color = Color.fromARGB(255, 144, 202, 249));
//   }
// }

class exampleappbar extends StatefulWidget {
  const exampleappbar({super.key});

  @override
  State<exampleappbar> createState() => _exampleappbarState();
}

class _exampleappbarState extends State<exampleappbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       floating: true,
      //       pinned: true,
      //       flexibleSpace: FlexibleSpaceBar(
      //         title: Text("My SliverAppBar"),
      //         centerTitle: true,
      //         background: Image.network(
      //             fit: BoxFit.cover,
      //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgSLk9N5FMm_WSh6U7-sC8AAxHU5m2ggh1Bw&s"),
      //       ),
      //       expandedHeight: 200,
      //       backgroundColor: Colors.red,
      //     ),
      //     buildImages(),
      //     // TabBarView(children: [
      //     //   buildImages(),
      //     //   buildImages(),
      //     // ])
      //   ],
      // ),

      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder: (context, index) {
              return [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  bottom: const TabBar(tabs: [
                    Text("Tab1"),
                    Text("tab2"),
                  ]),
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text("My SliverAppBar"),
                    centerTitle: true,
                    background: Image.network(
                        fit: BoxFit.cover,
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgSLk9N5FMm_WSh6U7-sC8AAxHU5m2ggh1Bw&s"),
                  ),
                  expandedHeight: 200,
                  backgroundColor: Colors.red,
                ),
              ];
            },
            body: TabBarView(children: [
              buildImagesTab(),
              buildImagesTab(),
            ])),
      ),
    );
  }

  Widget buildImages() => SliverToBoxAdapter(
        child: GridView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFv9NAQbVXwHY77_sNSQyobBtssivrD-zbxA&s"),
        ),
      );

  Widget buildImagesTab() => GridView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: 20,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFv9NAQbVXwHY77_sNSQyobBtssivrD-zbxA&s"),
      );
}

class shimmerloader extends StatefulWidget {
  const shimmerloader({super.key});

  @override
  State<shimmerloader> createState() => _shimmerloaderState();
}

class _shimmerloaderState extends State<shimmerloader> {
  bool isload = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isload = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Shimmer Loader"),
      ),
      body: ListView(children: [
        SizedBox(
          height: 300,
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: isload
                        ? Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqh23N9c_aH0PvHiaE-KNpcNP0ShomxKEqdQ&s"),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "This is Food Delivery",
                                style: TextStyle(color: Colors.grey.shade700),
                              )
                            ],
                          )
                        : myShimmerLoader(),
                  ),
                );
              }),
        )
      ]),
    );
  }

  myShimmerLoader() {
    return Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.orange,
        child: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              height: 20,
              color: Colors.grey,
            ))
          ],
        ));
  }
}

class swiablebuttonview extends StatefulWidget {
  const swiablebuttonview({super.key});

  @override
  State<swiablebuttonview> createState() => _swiablebuttonviewState();
}

class _swiablebuttonviewState extends State<swiablebuttonview> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SwipeableButtonView(
          onFinish: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const completedScreen(),
                    type: PageTransitionType.fade));
          },
          onWaitingProcess: () {
            Future.delayed(const Duration(seconds: 2), () async {
              setState(() {
                isFinished = true;
              });
            });
          },
          isFinished: isFinished,
          activeColor: Colors.green,
          buttonWidget: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          buttonText: "Slider to Pay",
        ),
      ),
    );
  }
}

// ignore: duplicate_ignore
// ignore: camel_case_types
class completedScreen extends StatelessWidget {
  const completedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class SwiperAnimation extends StatefulWidget {
  const SwiperAnimation({super.key});

  @override
  State<SwiperAnimation> createState() => _SwiperAnimationState();
}

class _SwiperAnimationState extends State<SwiperAnimation> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.8,
            decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Swiper(
              scrollDirection: Axis.vertical,
              itemCount: 6,
              layout: SwiperLayout.STACK,
              itemHeight: 260,
              itemWidth: 400,
              itemBuilder: (context, index) {
                return Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDu7Y-TOLjEmKBND_A_S0QzLhidFVD3gzSCQ&s"))),
                );
              },
            ),
            //     SizedBox(
            //   height: 400,
            //   child: PageView.builder(
            //       clipBehavior: Clip.hardEdge,
            //       controller: controller,
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 4,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           height: 400,
            //           width: 400,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20),
            //               image: DecorationImage(
            //                   image: NetworkImage(
            //                       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDu7Y-TOLjEmKBND_A_S0QzLhidFVD3gzSCQ&s"))),
            //         );
            //       }),
            // )),
          )
        ],
      ),
    );
  }
}
