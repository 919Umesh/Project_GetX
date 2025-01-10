import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class SampleEditor extends StatelessWidget {
  final QuillController _controller = QuillController.basic();

  SampleEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quill Flutter'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  controller: _controller,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('de'),
                  ),
                ),
              ),
            ),
          ),
          QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              controller: _controller,
              sharedConfigurations: const QuillSharedConfigurations(
                locale: Locale('de'),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final deltaJson = jsonEncode(_controller.document.toDelta().toJson());
              print("Quill Content in JSON: $deltaJson");
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Check console for JSON output.'),
                  duration: Duration(seconds: 3),
                ),
              );
            },
            child: const Text('Print JSON'),
          ),
        ],
      ),
    );
  }
}




