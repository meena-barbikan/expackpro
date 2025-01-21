import 'package:expackpro/listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class VideocallScreen extends StatefulWidget {
  const VideocallScreen({super.key});

  @override
  State<VideocallScreen> createState() => _VideocallScreenState();
}

class _VideocallScreenState extends State<VideocallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i.postimg.cc/0Q0n66Ff/call-bg.png"))),
          ),
          Positioned(
            bottom: 100,
            right: 10,
            child: Container(
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://i.postimg.cc/0Q0n66Ff/call-bg.png"))),
            ),
          ),
          Positioned(
              bottom: -70,
              left: 70,
              child: Container(
                height: 160,
                width: 300,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(00, 24),
                    blurRadius: 40,
                  )
                ]),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.volume_down),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.mic),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.videocam_off),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.call_end,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class ConstraniedBoxView extends StatelessWidget {
  const ConstraniedBoxView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.width;
    double screenwidth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ConstrainedBox"),
      ),
      backgroundColor: Colors.teal[300],
      body: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 100,
                  maxHeight: 300,
                  maxWidth: 300,
                  minWidth: 140,
                ),
                child: const Column(
                  children: [
                    Text("Flutter  Constrained Box"),
                    Image(
                        fit: BoxFit.cover,
                        height: 150,
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqGNPEcxhRePPkF3zLj1c2Z67EItsM4u03MA&s")),
                    Baseline(
                      baseline: 60,
                      baselineType: TextBaseline.alphabetic,
                      child: Text("Flutter"),
                    ),
                    Baseline(
                      baseline: 20,
                      baselineType: TextBaseline.ideographic,
                      child: Text("Codee"),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: screenheight * 0.2,
            width: screenwidth * 0.2,
            child: const Text("Flutter"),
          )
        ],
      ),
    );
  }
}

class dashboardview extends StatefulWidget {
  const dashboardview({super.key});

  @override
  State<dashboardview> createState() => _dashboardviewState();
}

class _dashboardviewState extends State<dashboardview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              "DELIVERY TO",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
            Text(
              "San Francisco",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Baseline(
              baseline: 20,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                "Filter",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://i.postimg.cc/VsTTkQ1j/big-1.png"))),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            child: Row(
              children: [
                Text(
                  "FEATURED PARTNERS",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                Spacer(),
                Text(
                  "CLEAR ALL",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 1,
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://i.postimg.cc/DfGvFKbX/medium-1.png")),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "The Halal Guys",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Colaroda , San Francisco",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "4.6",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("25 Mins"),
                              Spacer(),
                              Text(
                                "Free delivery",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16),
                              )
                            ],
                          ),
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

class DashboardScreenpicture extends StatefulWidget {
  const DashboardScreenpicture({super.key});

  @override
  State<DashboardScreenpicture> createState() => _DashboardScreenpictureState();
}

class _DashboardScreenpictureState extends State<DashboardScreenpicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        children: [
          SizedBox(
            height: 400,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(130, 150),
                        topRight: Radius.circular(150),
                        bottomRight: Radius.elliptical(
                          110,
                          140,
                        ),
                        bottomLeft: Radius.circular(10)),
                  ),
                  child: Baseline(
                      baseline: 190,
                      baselineType: TextBaseline.ideographic,
                      child: Image.asset(
                        "assets/cat.jpg",
                        height: 180,
                      )),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuTK8bXjobRPRzoTUs45uxrNNnh5Dt_nOrlg&s"))),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuTK8bXjobRPRzoTUs45uxrNNnh5Dt_nOrlg&s"))),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuTK8bXjobRPRzoTUs45uxrNNnh5Dt_nOrlg&s"))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
