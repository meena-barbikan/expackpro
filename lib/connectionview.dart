import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Connectionview extends StatefulWidget {
  const Connectionview({super.key});

  @override
  State<Connectionview> createState() => _ConnectionviewState();
}

class _ConnectionviewState extends State<Connectionview> {
  bool isinternetconnection = false;
  StreamSubscription? _internetconnectionStreamSubscription;

  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String lastwords = "";
  double _confidencelevel = 0;
  @override
  void initState() {
    _internetconnectionStreamSubscription =
        InternetConnection().onStatusChange.listen(
      (event) {
        print(event);
        switch (event) {
          case InternetStatus.connected:
            setState(() {
              isinternetconnection = true;
            });
            break;
          case InternetStatus.disconnected:
            setState(() {
              isinternetconnection = false;
            });
            break;

          default:
            setState(() {
              isinternetconnection = false;
            });
            break;
        }
      },
    );

    initspeech();
    super.initState();
  }

  void initspeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onspeechresult);
    setState(() {
      _confidencelevel = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onspeechresult(result) async {
    setState(() {
      lastwords = "${result.recognizedWords}";
      _confidencelevel = result.confidence;
    });
  }

  @override
  void dispose() {
    _internetconnectionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      Icon(
                        isinternetconnection ? Icons.wifi : Icons.wifi_off,
                        color: isinternetconnection ? Colors.green : Colors.red,
                        size: 25,
                      ),
                      Text(
                        isinternetconnection
                            ? "you Are Connected to The Internet"
                            : "You Are Not Connected to the Internet",
                        style: TextStyle(
                            color: isinternetconnection
                                ? Colors.green
                                : Colors.red,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Text("Speech Demo"),
              Container(
                child: Text(_speechToText.isListening
                    ? "Listening..."
                    : _speechEnabled
                        ? "Tap to microphone to start Listening.."
                        : "Speech not Available"),
              ),
              Expanded(
                  child: Container(
                child: Text(
                  lastwords,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )),
              if (_speechToText.isNotListening && _confidencelevel > 0)
                Text(
                  "confidence : ${(_confidencelevel * 100).toStringAsFixed(1)} %",
                  style: TextStyle(fontSize: 18),
                ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:
              _speechToText.isListening ? _stopListening : _startListening,
          tooltip: "Listen",
          child: Icon(
            _speechToText.isNotListening
                ? Icons.mic_off_outlined
                : Icons.mic_none_outlined,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
        ));
  }
}
