import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Mulitplefile extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onopendedFile;
  const Mulitplefile(
      {super.key, required this.files, required this.onopendedFile});

  @override
  State<Mulitplefile> createState() => _MulitplefileState();
}

class _MulitplefileState extends State<Mulitplefile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiple File "),
      ),
      body: ListView.builder(
          itemCount: widget.files.length,
          itemBuilder: (context, index) {
            final files = widget.files[index];
            return bulidlistile(files);
          }),
    );
  }

  Widget bulidlistile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2).toString()} MB'
        : "${kb.toStringAsFixed(2).toString()} KB";
    return InkWell(
      onTap: () {
        widget.onopendedFile(file);
      },
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(right: 230),
          child: Image.file(
            File(file.path.toString()),
            width: 180,
            height: 60,
          ),
        ),
        //  title: Text(file.name),
        subtitle: Text(size),
        trailing: Text("${file.extension}"),
      ),
    );
  }
}
