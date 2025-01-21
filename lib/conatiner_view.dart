import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:readmore/readmore.dart';
import 'package:status_alert/status_alert.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Container Example"),
        ),
        body: Center(
          child: Container(
            // Size
            height: 200.0,
            width: 200.0,

            // Padding
            padding: const EdgeInsets.all(20.0),

            // Margin
            margin: const EdgeInsets.all(10.0),

            // Decoration
            decoration: BoxDecoration(
              color: Colors.blue, // Background color
              border: Border.all(
                color: Colors.black, // Border color
                width: 3.0, // Border width
              ),
              borderRadius: BorderRadius.circular(15.0), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: const Offset(3, 3), // Shadow position
                ),
              ],
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple], // Gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),

            // Transform
            transform: Matrix4.rotationZ(0.1), // Rotate container slightly

            // Alignment and Child
            alignment: Alignment.center,
            child: const Text(
              "Hello, Flutter!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppSizedbox extends StatelessWidget {
  const MyAppSizedbox({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("SizedBox Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Fixed size
              SizedBox(
                height: 100.0,
                width: 200.0,
                child: Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      "SizedBox 1",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0), // Adds spacing

              // Acts as a spacer
              const SizedBox(
                height: 50.0,
                child: Center(
                  child: Text(
                    "Spacer",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20.0), // Adds spacing

              // Zero-size box
              SizedBox.shrink(
                child: Container(
                  color: Colors.red,
                  child: const Text("This won't be visible"),
                ),
              ),

              const SizedBox(height: 20.0), // Adds spacing

              // Infinite-sized box (fills available space)
              Expanded(
                child: SizedBox.expand(
                  child: Container(
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        "SizedBox.expand",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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

class MyAppSizeTransition extends StatelessWidget {
  const MyAppSizeTransition({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SizeTransitionExample(),
    );
  }
}

class SizeTransitionExample extends StatefulWidget {
  const SizeTransitionExample({super.key});

  @override
  _SizeTransitionExampleState createState() => _SizeTransitionExampleState();
}

class _SizeTransitionExampleState extends State<SizeTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Animation duration
    );

    // Define the animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn, // Animation curve
    );

    // Start the animation
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SizeTransition Example"),
      ),
      body: Center(
        child: SizeTransition(
          sizeFactor: _animation, // Animate the size
          axis: Axis.vertical, // Animate along the vertical axis
          axisAlignment: -1.0, // Align the animation to the top
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.blueAccent,
            child: const Text(
              "Flutter Size Transition!",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppText extends StatelessWidget {
  const MyAppText({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Text Widget Properties Example'),
        ),
        body: Column(
          children: [
            const Center(
              child: Text(
                'Flutter Text Widget Example\nwith all properties!',
                style: TextStyle(
                  color: Colors.blue, // Text color
                  fontSize: 20.0, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                  fontStyle: FontStyle.italic, // Font style
                  letterSpacing: 2.0, // Spacing between letters
                  wordSpacing: 5.0, // Spacing between words
                  decoration: TextDecoration.underline, // Text decoration
                  decorationColor: Colors.red, // Decoration color
                  decorationStyle:
                      TextDecorationStyle.dotted, // Decoration style
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0), // Shadow offset
                      blurRadius: 2.0, // Shadow blur radius
                      color: Colors.grey, // Shadow color
                    ),
                  ],
                ),
                textAlign: TextAlign.center, // Align text within the widget
                textDirection: TextDirection.rtl, // Text direction (ltr or rtl)
                maxLines: 2, // Maximum number of lines for the text
                overflow:
                    TextOverflow.ellipsis, // Handle overflow with ellipsis
                softWrap: false, // Wrap text if it overflows
              ),
            ),
            Center(
              widthFactor: 2.0, // Width multiplier
              heightFactor: 1.5, // Height multiplier
              child: Container(
                color: Colors.blueAccent,
                width: 100,
                height: 100,
                child: const Center(
                  child: Text(
                    'Hello!',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            Center(
              child: Image.network(
                'https://via.placeholder.com/150', // Image URL
                width: 150, // Image width
                height: 150, // Image height
                fit: BoxFit.cover, // How the image should be fitted
                alignment: Alignment.center, // Alignment inside the container
                color: Colors.blue.withOpacity(0.5), // Blend color
                colorBlendMode: BlendMode.darken, // Blend mode
                repeat: ImageRepeat.noRepeat, // Image repetition
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return const Center(
                    child: Text('Error loading image!',
                        style: TextStyle(color: Colors.red)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomAppBarExample extends StatelessWidget {
  const BottomAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomAppBar Example'),
      ),
      body: const Center(
        child: Text(
          'Content goes here',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mouseCursor: MouseCursor.uncontrolled,
        onPressed: () {
          // Floating Action Button Action
          print("FloatingActionButton Pressed");
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // Creates the notch for FAB
        color: Colors.blue,
        notchMargin: 8.0, // Space around the FAB notch
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                print("Home Pressed");
              },
              icon: const Icon(Icons.home, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                print("Search Pressed");
              },
              icon: const Icon(Icons.search, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                print("Notifications Pressed");
              },
              icon: const Icon(Icons.notifications, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                print("Settings Pressed");
              },
              icon: const Icon(Icons.settings, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class Bottomappbarview extends StatefulWidget {
  const Bottomappbarview({super.key});

  @override
  State<Bottomappbarview> createState() => _BottomappbarviewState();
}

class _BottomappbarviewState extends State<Bottomappbarview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        color: Colors.lightBlue[800],
        child: Container(
          height: 55,
          width: 100,
          alignment: Alignment.center,
          child: const Text("BottomAppbar"),
        ),
      ),
    );
  }
}

class Bottomnavigationview extends StatefulWidget {
  const Bottomnavigationview({super.key});

  @override
  State<Bottomnavigationview> createState() => _BottomnavigationviewState();
}

class _BottomnavigationviewState extends State<Bottomnavigationview> {
  int index = 0;

  final List _pages = [homepage(), CardPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: BottomNavigationBar(
          mouseCursor: MouseCursor.defer,
          type: BottomNavigationBarType.fixed,
          // fixedColor: Colors.amber,

          currentIndex: index,
          // onTap: (value) {
          //   setState(() {
          //     index = value;
          //   });
          // },
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          unselectedItemColor: Colors.greenAccent,
          selectedItemColor: Colors.blueAccent,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "SetMeal"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
            BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Phone"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu")
          ]),
      body: _pages[index],
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Text("Find Your Favorite Food"),
        title: const Text(
          "Find Your \nFavorite Food",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        //leadingWidth: 0,
        actions: [
          Icon(
            Icons.notifications,
            size: 25,
            color: Colors.green,
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              child: Row(
                children: [
                  SizedBox(
                    width: 380,
                    child: TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          hintText: "Want to You want to order",
                          prefixIcon: Icon(Icons.search),
                          fillColor: Colors.amberAccent[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.amberAccent[200],
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.widgets_outlined),
                  ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmwla6vUQK67X5KHksARyVrL4Evo509hBcCA&s"))),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 150, top: 20),
                    child: Text(
                      "Special Deal for \nOctober",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 20),
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "BuyNow",
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  Text(
                    "Nearest Restaurant",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "ViewMore",
                    style: TextStyle(color: Colors.greenAccent),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300)),
                    height: 130,
                    width: 180,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                          child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlCeVhPcF0B061dWx6Y2p6ZshztnAoVQI59g&s"),
                        ),
                        Text(
                          "Food Name",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "12 min",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardPage"),
      ),
    );
  }
}

class SingleChildScrollViewExample extends StatelessWidget {
  const SingleChildScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal Scrolling Example'),
      ),
      body: ListView(
        scrollDirection:
            Axis.vertical, // Changed to vertical scrolling for proper layout
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                10,
                (index) => Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Item ${index + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.search),
            title: Text("Data"),
            subtitle: Text("Flutter"),
            trailing: Icon(Icons.abc),
          ),
          const Column(
            children: [
              Text('First Item'),
              Gap(20), // Adds 20px gap
              Text('Second Item'),
              Gap(40), // Adds 40px gap
              Text('Third Item'),
            ],
          ),
        ],
      ),
    );
  }
}

class Drawerview extends StatefulWidget {
  const Drawerview({super.key});

  @override
  State<Drawerview> createState() => _DrawerviewState();
}

class _DrawerviewState extends State<Drawerview> {
  // Create a GlobalKey for the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: AppDrawerview(),
      ),
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        icon: const Icon(Icons.settings),
      )),
    );
  }
}

class AppDrawerview extends StatelessWidget {
  const AppDrawerview({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('App Drawer'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Handle the tap here
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Handle the tap here
            },
          ),
        ],
      ),
    );
  }
}

class StatusAlertbox extends StatefulWidget {
  const StatusAlertbox({super.key});

  @override
  State<StatusAlertbox> createState() => _StatusAlertboxState();
}

class _StatusAlertboxState extends State<StatusAlertbox>
    with TickerProviderStateMixin {
  void Showsucesalert(BuildContext context) {
    StatusAlert.show(context,
        title: "Sucess Alert",
        subtitle: "Successfully Created",
        maxWidth: 300,
        backgroundColor: Colors.indigo[50]);
  }

  void showErrorAlert(BuildContext context) {
    StatusAlert.show(context,
        title: "Error Alert",
        subtitle: "Successfully Created",
        maxWidth: 300,
        backgroundColor: Colors.indigo[50]);
  }

  // State variable to control opacity
  double _opacity = 0.0;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  // Function to trigger the fade-in animation
  void _fadeIn() {
    setState(() {
      _opacity = 1.0; // Set the opacity to fully visible
    });
  }

  bool _animate = true;
  bool _ischecked = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Schedule animation toggle to repeat
    Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _animate = !_animate; // Toggle animation
      });
    });
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        flexibleSpace: Container(
            width: 80,
            height: 170,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s"),
            )),
            child: const Text("data")),
        //title: const Text("Status Alert"),
        //centerTitle: true,
        toolbarHeight: 200,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 40),
              child: IconButton(
                  onPressed: () {
                    if (_ischecked) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                    _ischecked = !_ischecked;
                    //_globalKey.currentState?.openEndDrawer();
                  },
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.home_menu, progress: _controller))),
          IconButton(
            onPressed: () {
              _globalKey.currentState?.openEndDrawer();
            },
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      endDrawer: const Drawer(
        child: Column(
          children: [Text("Drawer")],
        ),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Showsucesalert(context);
            },
            child: const Text("Success Alert"),
          ),
          ElevatedButton(
            onPressed: () {
              showErrorAlert(context);
            },
            child: const Text("Error Alert"),
          ),
          Center(
              child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ReadMoreText(
                        '''GeeksForGeeks is the best tutorial website for programmers. 
                         If you are beginner or intermediate or expert programmer 
                         GeeksForGeeks is the best website for learning to code  
                         and learn different frameworks.''',
                        trimLines: 2,
                        // textScaleFactor: 1,
                        colorClickableText: Colors.red,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        moreStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    );
                  })),
          const Text("BounceIn in Animation"),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                BounceInUp(
                    duration: const Duration(seconds: 4),
                    child: const NewContainer()),
                const Gap(10),
                BounceInDown(
                    duration: const Duration(seconds: 4),
                    child: const NewContainer()),
                const Gap(10),
                BounceInUp(
                    duration: const Duration(seconds: 4),
                    child: const NewContainer()),
                const Gap(10),
                BounceInDown(
                    duration: const Duration(seconds: 4),
                    child: const NewContainer())
              ],
            ),
          ),
          const Text("Fade in Animation"),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                FadeInLeft(
                    duration: const Duration(seconds: 4),
                    child: const NewContainer()),
                const Gap(20),
                FadeInUp(
                    duration: const Duration(seconds: 4),
                    child: const NewContainer()),
                const Gap(20),
                FadeInDown(
                    duration: const Duration(seconds: 4),
                    child: const NewContainer()),
                const Gap(20),
                FadeInRight(
                    duration: const Duration(seconds: 4),
                    child: const NewContainer()),
                const Gap(20),
              ],
            ),
          ),
          const Text("Side in Animation"),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                SlideInLeft(
                    delay: const Duration(seconds: 5),
                    duration: const Duration(seconds: 4),
                    child: const NewContainer()),
                const Gap(10),
                SlideInLeft(
                    delay: const Duration(seconds: 4),
                    duration: const Duration(seconds: 4),
                    child: const NewContainer()),
                const Gap(10),
                SlideInLeft(
                    delay: const Duration(seconds: 3),
                    duration: const Duration(seconds: 4),
                    child: const NewContainer()),
                const Gap(10),
                SlideInLeft(
                    duration: const Duration(seconds: 4),
                    child: const NewContainer())
              ],
            ),
          ),
          AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText('AWESOME',
                  textStyle: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      backgroundColor: Colors.blue)),
              RotateAnimatedText('OPTIMISTIC',
                  textStyle: const TextStyle(
                      letterSpacing: 3,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange)),
              RotateAnimatedText(
                'DIFFERENT',
                textStyle: const TextStyle(
                  fontSize: 30,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
            isRepeatingAnimation: true,
            totalRepeatCount: 10,
            pause: const Duration(milliseconds: 1000),
          ),
          AnimatedTextKit(animatedTexts: [
            FadeAnimatedText(
              "Flutter FadeAnimated Text",
              textAlign: TextAlign.center,
              textStyle: TextStyle(color: Colors.lightBlue[900], fontSize: 30),
            ),
            ScaleAnimatedText(
              "Flutter ScaleAnimated Text",
              textAlign: TextAlign.center,
              textStyle: const TextStyle(color: Colors.amber, fontSize: 20),
            )
          ]),
          AnimatedTextKit(repeatForever: true, animatedTexts: [
            TyperAnimatedText("Flutter AnimatedText",
                textAlign: TextAlign.center,
                textStyle: const TextStyle(color: Colors.cyan, fontSize: 30))
          ]),
          AnimatedTextKit(repeatForever: true, animatedTexts: [
            WavyAnimatedText("Flutter Wavy AnimatedText",
                textAlign: TextAlign.center,
                textStyle:
                    const TextStyle(color: Colors.deepPurple, fontSize: 25))
          ]),
          IconButton(
              onPressed: () {
                if (_ischecked) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
                _ischecked = !_ischecked;
              },
              icon: AnimatedIcon(
                  icon: AnimatedIcons.home_menu, progress: _controller))
        ],
      ),
    );
  }
}

class NewContainer extends StatelessWidget {
  const NewContainer({super.key});

  Widget build(BuildContext context) {
    return Container(height: 60, width: 60, color: Colors.green);
  }
}

//For using SystemChrome

class MyAppLandsscape extends StatelessWidget {
  const MyAppLandsscape({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'This app can\'t be rotated to Landscape mode',
            style: TextStyle(color: Colors.green, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

//List of Cards with size
List<StaggeredGridTile> _cardTile = [
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    child: BackGroundTile(backgroundColor: Colors.red, icondata: Icons.home),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child:
        BackGroundTile(backgroundColor: Colors.orange, icondata: Icons.ac_unit),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    child:
        BackGroundTile(backgroundColor: Colors.pink, icondata: Icons.landscape),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child:
        BackGroundTile(backgroundColor: Colors.green, icondata: Icons.portrait),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
    child: BackGroundTile(
        backgroundColor: Colors.deepPurpleAccent, icondata: Icons.music_note),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
    child: BackGroundTile(
        backgroundColor: Colors.blue, icondata: Icons.access_alarms),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
    child: BackGroundTile(
        backgroundColor: Colors.indigo, icondata: Icons.satellite_outlined),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
    child: BackGroundTile(
        backgroundColor: Colors.deepPurpleAccent, icondata: Icons.music_note),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
    child: BackGroundTile(
        backgroundColor: Colors.deepPurpleAccent, icondata: Icons.music_note),
  ),
];

class HomePageGridVIEW extends StatelessWidget {
  const HomePageGridVIEW({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GFG App"),
      ),
      body: SingleChildScrollView(
        child: Container(
          // Staggered Grid View starts here
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: _cardTile,
          ),
        ),
      ),
    );
  }
}

class BackGroundTile extends StatelessWidget {
  final Color backgroundColor;
  final IconData icondata;

  BackGroundTile(
      {super.key, required this.backgroundColor, required this.icondata});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Icon(icondata, color: Colors.white),
    );
  }
}

class MasonryGridViewExample extends StatelessWidget {
  final List<int> _dummyData = List.generate(20, (index) => index + 1);

  MasonryGridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masonry GridView Example'),
      ),
      body: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
        ),
        itemCount: _dummyData.length,
        mainAxisSpacing: 8, // Spacing between rows
        crossAxisSpacing: 8, // Spacing between columns
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.primaries[index % Colors.primaries.length],
            child: Container(
              height: (100 + (index % 4) * 50).toDouble(), // Varying heights
              alignment: Alignment.center,
              child: Text(
                'Item ${_dummyData[index]}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class GridExampleHome extends StatelessWidget {
  const GridExampleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Grid Examples'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Masonry'),
              Tab(text: 'Staggered'),
              Tab(text: 'Quilted'),
              Tab(text: 'Woven'),
              Tab(text: 'Aligned'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MasonryGridExample(),
            const StaggeredGridExample(),
            const QuiltedGridExample(),
            const WovenGridExample(),
            const AlignedGridExample(),
          ],
        ),
      ),
    );
  }
}

// 1. Masonry Grid Example
class MasonryGridExample extends StatelessWidget {
  final List<String> images = [
    'https://via.placeholder.com/200x300',
    'https://via.placeholder.com/400x200',
    'https://via.placeholder.com/300x400',
    'https://via.placeholder.com/200x200',
    'https://via.placeholder.com/500x300',
  ];

  MasonryGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(images[index], fit: BoxFit.cover),
        );
      },
    );
  }
}

// 2. Staggered Grid Example
class StaggeredGridExample extends StatelessWidget {
  const StaggeredGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: _buildTile(Colors.red)),
        StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: _buildTile(Colors.blue)),
        StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: _buildTile(Colors.green)),
        StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 2,
            child: _buildTile(Colors.yellow)),
      ],
    );
  }

  Widget _buildTile(Color color) {
    return Container(
      color: color,
      child: const Center(
          child: Text('Tile', style: TextStyle(color: Colors.white))),
    );
  }
}

// 3. Quilted Grid Example
class QuiltedGridExample extends StatelessWidget {
  const QuiltedGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
    // return MasonryGridView.custom(
    //   gridDelegate: SliverQuiltedGridDelegate(
    //     crossAxisCount: 4,
    //     mainAxisSpacing: 8,
    //     crossAxisSpacing: 8,
    //     repeatPattern: QuiltedGridRepeatPattern.inverted,
    //     pattern: [
    //       QuiltedGridTile(2, 2),
    //       QuiltedGridTile(1, 2),
    //       QuiltedGridTile(1, 1),
    //       QuiltedGridTile(1, 1),
    //     ],
    //   ),
    //   childrenDelegate: SliverChildBuilderDelegate(
    //     (context, index) => Container(
    //       color: Colors.primaries[index % Colors.primaries.length],
    //       child: Center(child: Text('Tile $index', style: TextStyle(color: Colors.white))),
    //     ),
    //     childCount: 10,
    //   ),
    // );
  }
}

// 4. Woven Grid Example
class WovenGridExample extends StatelessWidget {
  const WovenGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
    // MasonryGridView.custom(
    //   gridDelegate: SliverWovenGridDelegate.count(
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 8,
    //     crossAxisSpacing: 8,
    //     pattern: [
    //       WovenGridTile(1),
    //       WovenGridTile(5 / 7, alignment: AlignmentDirectional.centerEnd),
    //     ],
    //   ),
    //   childrenDelegate: SliverChildBuilderDelegate(
    //     (context, index) => Container(
    //       color: Colors.primaries[index % Colors.primaries.length],
    //       child: Center(
    //           child:
    //               Text('Tile $index', style: TextStyle(color: Colors.white))),
    //     ),
    //     childCount: 20,
    //   ),
    // );
  }
}

// 5. Aligned Grid Example
class AlignedGridExample extends StatelessWidget {
  const AlignedGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.primaries[index % Colors.primaries.length],
          child: Center(
              child: Text('Tile $index',
                  style: const TextStyle(color: Colors.white))),
        );
      },
    );
  }
}

class orientationbuilderview extends StatefulWidget {
  const orientationbuilderview({super.key});

  @override
  State<orientationbuilderview> createState() => _orientationbuilderviewState();
}

class _orientationbuilderviewState extends State<orientationbuilderview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OrientationView"),
      ),
      body: ListView(
        children: [
          GridView.count(
              primary: false,
              shrinkWrap: true,
              crossAxisCount: Orientation == Orientation.portrait ? 2 : 3,
              children: List.generate(30, (index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 50,
                    width: 60,
                    color: Colors.amber,
                  ),
                );
              }))
        ],
      ),
    );
  }
}

class SpeedDialmenu extends StatefulWidget {
  const SpeedDialmenu({super.key});

  @override
  State<SpeedDialmenu> createState() => _SpeedDialmenuState();
}

class _SpeedDialmenuState extends State<SpeedDialmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Speed Dial"),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              foregroundColor: Colors.amberAccent,
              label: "Home",
              labelWidget: const CircleAvatar(
                  radius: 25, child: Icon(Icons.home_filled))),
          SpeedDialChild(
              foregroundColor: Colors.lightBlue,
              label: "Search",
              labelWidget: const CircleAvatar(
                  radius: 25, child: Icon(Icons.search_outlined))),
          SpeedDialChild(
              foregroundColor: Colors.brown,
              label: "Settings",
              labelWidget:
                  const CircleAvatar(radius: 25, child: Icon(Icons.settings))),
          SpeedDialChild(
              foregroundColor: Colors.blueGrey,
              label: "Email",
              labelWidget:
                  const CircleAvatar(radius: 25, child: Icon(Icons.email))),
        ],
      ),
    );
  }
}

class OpenDialog extends StatelessWidget {
  // Function to show the animated dialog
  void _showAnimatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AnimatedAlertDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated AlertDialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAnimatedDialog(context);
          },
          child: Text('Show Animated Dialog'),
        ),
      ),
    );
  }
}

class AnimatedAlertDialog extends StatefulWidget {
  @override
  _AnimatedAlertDialogState createState() => _AnimatedAlertDialogState();
}

class _AnimatedAlertDialogState extends State<AnimatedAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800), // Adjust the duration as needed
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation when
    // the dialog is displayed
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AlertDialog(
          title: Text("Animated Alert Dialog"),
          content: Text("This is an animated AlertDialog."),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                // Reverse the animation
                // and close the dialog
                _controller.reverse();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
