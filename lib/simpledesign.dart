// ignore_for_file: unnecessary_const

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

class Simpledesign extends StatefulWidget {
  const Simpledesign({super.key});

  @override
  State<Simpledesign> createState() => _SimpledesignState();
}

class _SimpledesignState extends State<Simpledesign> {
  // Dummy data for cards
  final List<Map<String, dynamic>> experimentData = [
    {
      "title": "A-Don't Forget",
      "color": Colors.red.shade100,
      "tasks": "42 Task",
      "icon": Icons.dashboard,
    },
  ];
  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  final colorizeTextStyle = const TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: experimentData.length,
                  itemBuilder: (context, index) {
                    final item = experimentData[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Slidable(
                        startActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(
                            onPressed: donothing(),
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          SlidableAction(
                            onPressed: donothing(),
                            backgroundColor: const Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.share,
                            label: 'Share',
                          ),
                        ]),
                        child: CardWidget(
                          color: item["color"],
                          icon: item["icon"],
                          title: item["title"],
                          tasks: item["tasks"],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(width: 20.0, height: 100.0),
                    const Text(
                      'Be',
                      style: TextStyle(fontSize: 43.0),
                    ),
                    const SizedBox(width: 20.0, height: 100.0),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'Horizon',
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          RotateAnimatedText('AWESOME'),
                          RotateAnimatedText('OPTIMISTIC'),
                          RotateAnimatedText('DIFFERENT'),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: AnimatedTextKit(animatedTexts: [
                          FadeAnimatedText("Do It!",
                              textStyle: const TextStyle(color: Colors.black)),
                          FadeAnimatedText("Do It Right!",
                              textStyle: const TextStyle(color: Colors.black)),
                          FadeAnimatedText("Do It Right Now!",
                              textStyle: const TextStyle(color: Colors.black)),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: AnimatedTextKit(animatedTexts: [
                          TyperAnimatedText("Do It!",
                              textStyle: const TextStyle(color: Colors.black)),
                          TyperAnimatedText("Do It Right!",
                              textStyle: const TextStyle(color: Colors.black)),
                          TyperAnimatedText("Do It Right Now!",
                              textStyle: const TextStyle(color: Colors.black)),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: AnimatedTextKit(animatedTexts: [
                          ScaleAnimatedText("Do It!",
                              textStyle: const TextStyle(color: Colors.black)),
                          ScaleAnimatedText("Do It Right!",
                              textStyle: const TextStyle(color: Colors.black)),
                          ScaleAnimatedText("Do It Right Now!",
                              textStyle: const TextStyle(color: Colors.black)),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: AnimatedTextKit(animatedTexts: [
                          TypewriterAnimatedText("Do It!",
                              textStyle: const TextStyle(color: Colors.black)),
                          TypewriterAnimatedText("Do It Right!",
                              textStyle: const TextStyle(color: Colors.black)),
                          TypewriterAnimatedText("Do It Right Now!",
                              textStyle: const TextStyle(color: Colors.black)),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                SizedBox(
                  width: 300.0,
                  height: 70,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'Larry Page',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                      ColorizeAnimatedText(
                        'Bill Gates',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                      ColorizeAnimatedText(
                        'Steve Jobs',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                //     SizedBox(
                //       width: 300.0,
                //       height: 70,
                //       child: TextLiquidFill(
                //         text: 'LIQUIDY',
                //         waveColor: Colors.blueAccent,
                //         boxBackgroundColor: Colors.redAccent,
                //         textStyle: TextStyle(
                //           fontSize: 40.0,
                //           fontWeight: FontWeight.bold,
                //         ),
                //         boxHeight: 300.0,
                //       ),
                //     ),
                //   ],
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('Hello World'),
                      WavyAnimatedText('Look at the waves'),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                )
              ]),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 7.0,
                        color: Colors.blue,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      FlickerAnimatedText('Flicker Frenzy'),
                      FlickerAnimatedText('Night Vibes On'),
                      FlickerAnimatedText("C'est La Vie !"),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                height: 150,
                child: TextLiquidFill(
                  text: 'LIQUIDY',
                  waveColor: Colors.blueAccent,
                  boxBackgroundColor: Colors.redAccent,
                  textStyle: const TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                  ),
                  boxHeight: 140.0,
                ),
              ),
            ],
          ),
        ));
  }

  donothing() {}
}

class CardWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String tasks;

  const CardWidget({
    required this.color,
    required this.icon,
    required this.title,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(height: 16),
            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            // Tasks and Progress
            Text(
              tasks,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateTimePickerExample extends StatefulWidget {
  @override
  _DateTimePickerExampleState createState() => _DateTimePickerExampleState();
}

class _DateTimePickerExampleState extends State<DateTimePickerExample> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // Function to pick a date
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // Function to pick a time
  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date & Time Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedDate != null
                  ? "Selected Date: ${selectedDate!.toLocal()}"
                  : "No date selected",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _pickDate(context),
              child: const Text("Select Date"),
            ),
            const SizedBox(height: 20),
            Text(
              selectedTime != null
                  ? "Selected Time: ${selectedTime!.format(context)}"
                  : "No time selected",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _pickTime(context),
              child: const Text("Select Time"),
            ),
          ],
        ),
      ),
    );
  }
}
