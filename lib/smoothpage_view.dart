import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothpageView extends StatefulWidget {
  const SmoothpageView({super.key});

  @override
  State<SmoothpageView> createState() => _SmoothpageViewState();
}

class _SmoothpageViewState extends State<SmoothpageView> {
  @override
  PageController _controller = PageController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 300,
            child: PageView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCZlf5lc5tX-0gY-y94pGS0mQdL-D0lCH2OQ&s"))),
                  );
                }),
          ),
          SizedBox(
              child: Column(
            children: [
              Text("Smooth Page Indicator, wrom Effect"),
              SmoothPageIndicator(
                controller: _controller,
                count: 6,
                effect: WormEffect(activeDotColor: Colors.lightBlue),
              )
            ],
          )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              child: Column(
            children: [
              Text("Smooth Page Indicator ExpandingDotEffects"),
              SmoothPageIndicator(
                controller: _controller,
                count: 6,
                effect: ExpandingDotsEffect(activeDotColor: Colors.green),
              )
            ],
          )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              child: Column(
            children: [
              Text("Smooth Page Indicator jumbingEffects"),
              SmoothPageIndicator(
                controller: _controller,
                count: 6,
                effect: JumpingDotEffect(
                    activeDotColor: Colors.green, verticalOffset: 20),
              )
            ],
          )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              child: Column(
            children: [
              Text("Smooth Page Indicator jumbingEffects"),
              SmoothPageIndicator(
                controller: _controller,
                count: 6,
                effect: ScrollingDotsEffect(
                  activeDotColor: Colors.indigo,
                ),
              )
            ],
          )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              child: Column(
            children: [
              Text("Smooth Page Indicator jumbingEffects"),
              SmoothPageIndicator(
                controller: _controller,
                count: 6,
                effect: SwapEffect(
                  activeDotColor: Colors.indigo,
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
