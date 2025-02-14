import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Animationview extends StatefulWidget {
  const Animationview({super.key});

  @override
  State<Animationview> createState() => _AnimationviewState();
}

class _AnimationviewState extends State<Animationview>
    with SingleTickerProviderStateMixin {
  double _size = 300;
  bool isselect = true;
  double padvalue = 00;
  bool ispay = false;
  bool isfade = false;
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<double> _scaletransition;
  double _fontsize = 40;
  Color _color = Colors.blue;
  IconData lastIconSelect = Icons.notification_add;

  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.menu,
    Icons.notifications,
    Icons.phone,
    Icons.settings,
  ];
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
    _animation = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 2.0))
        .animate(_controller);
    _scaletransition =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Flow(delegate: FlowMenuDelegate(menuAnimation: _controller)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _size = _size == 300 ? 100 : 300;
                  });
                },
                child: Container(
                  color: Colors.white,
                  child: AnimatedSize(
                    curve: Curves.easeInCubic,
                    duration: const Duration(milliseconds: 300),
                    child: FlutterLogo(
                      size: _size,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isselect = !isselect;
                  });
                },
                child: AnimatedDefaultTextStyle(
                  style: TextStyle(
                      fontSize: isselect ? 80 : 40,
                      color: isselect ? Colors.grey : Colors.lightBlueAccent),
                  duration: const Duration(milliseconds: 200),
                  child: const Text("Flutter"),
                ),
              ),
              SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            if (ispay == false) {
                              _controller.forward();
                              ispay = true;
                            } else {
                              _controller.reverse();
                              ispay = false;
                            }
                          },
                          child: AnimatedIcon(
                            icon: AnimatedIcons.play_pause,
                            progress: _controller,
                            color: Colors.black,
                            size: 100,
                          ),
                        ),
                      ),
                      SlideTransition(
                        position: _animation,
                        child: const SizedBox(
                          height: 80,
                          child: Image(
                              height: 60,
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTymXV83GJgiRSmK-MZMr5Q7SwFEaqphO5kGA&s")),
                        ),
                      ),
                      ScaleTransition(
                        scale: _scaletransition,
                        child: CachedNetworkImage(
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTymXV83GJgiRSmK-MZMr5Q7SwFEaqphO5kGA&s"),
                      ),
                      RotationTransition(
                        turns: _scaletransition,
                        child: CachedNetworkImage(
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTymXV83GJgiRSmK-MZMr5Q7SwFEaqphO5kGA&s"),
                      ),
                      FadeTransition(
                        opacity: _scaletransition,
                        child: CachedNetworkImage(
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTymXV83GJgiRSmK-MZMr5Q7SwFEaqphO5kGA&s"),
                      ),
                      SizeTransition(
                        sizeFactor: _scaletransition,
                        child: CachedNetworkImage(
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTymXV83GJgiRSmK-MZMr5Q7SwFEaqphO5kGA&s"),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isfade = !isfade;
                  });
                },
                child: AnimatedPhysicalModel(
                    shape: BoxShape.rectangle,
                    curve: Curves.bounceOut,
                    elevation: isfade ? 0 : 6,
                    color: Colors.white,
                    shadowColor: Colors.red,
                    duration: const Duration(milliseconds: 400),
                    child: Container(
                      height: 100,
                      width: 200,
                      color: Colors.blue, // Add some color for visibility
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    padvalue = padvalue == 0.0 ? 100 : 00;
                  });
                },
                child: AnimatedPadding(
                  curve: Curves.bounceOut,
                  duration: const Duration(milliseconds: 400),
                  padding: EdgeInsets.all(padvalue),
                  child: Container(
                    height: 100,
                    width: 200,
                    color: Colors.blue, // Add some color for visibility
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                width: 60,
                color: Colors.amber,
                child: const Baseline(
                  baseline: 40,
                  baselineType: TextBaseline.alphabetic,
                  child: FlutterLogo(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: GridTile(
                  header: const GridTileBar(
                    leading: Icon(Icons.sports_baseball_sharp),
                    trailing: Icon(Icons.sports_basketball_outlined),
                    backgroundColor: Colors.black45,
                  ),
                  footer: const GridTileBar(
                    title: Text("data"),
                  ),
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNxjRrQEpJONmDpWm16lFZ-cwXsFQu57_K9g&s"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// class FlowMenuDelegate extends FlowDelegate {

//   FlowMenuDelegate({required menuAnimation}):super(repaint: menuAnimation);
//   final Animation<double> menuAnimation;
//   @override
//   void paintChildren(FlowPaintingContext context) {
//     // TODO: implement paintChildren
//   }

//   @override
//   bool shouldRepaint( FlowDelegate oldDelegate) {
//     return menuAnimation! = oldDelegate.menuAnimation;
//   }
  
// }
