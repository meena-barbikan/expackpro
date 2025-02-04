import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class Voicerecord extends StatefulWidget {
  const Voicerecord({super.key});

  @override
  State<Voicerecord> createState() => _VoicerecordState();
}

class _VoicerecordState extends State<Voicerecord> {
  @override
  bool isrecording = false;
  String? recordingpath;
  final AudioRecorder audiorecord = AudioRecorder();
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _recordingButton(),
    );
  }

  Widget _recordingButton() {
    return FloatingActionButton(
      onPressed: () async {
        if (isrecording) {
          String? filepath = await audiorecord.stop();
          if (filepath != null) {
            isrecording = false;
            recordingpath = filepath;
          }
        } else {
          if (await audiorecord.hasPermission()) {
            final Directory appdocumentsDirc =
                await getApplicationDocumentsDirectory();
            final String filepath =
                p.join(appdocumentsDirc.path, "Recording.wav");
            await audiorecord.start(const RecordConfig(), path: filepath);
            setState(() {
              isrecording = true;
              recordingpath = null;
            });
          }
        }
      },
      child: Icon(isrecording ? Icons.stop : Iconsax.microphone),
    );
  }
}
