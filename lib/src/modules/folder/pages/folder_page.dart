import 'package:flutter/material.dart';

class FolderPage extends StatelessWidget {
  const FolderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FolderPage')),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      ),
    );
  }
}
