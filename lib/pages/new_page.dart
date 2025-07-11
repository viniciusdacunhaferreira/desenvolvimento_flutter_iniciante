import 'package:flutter/material.dart';

import '../extensions/build_context.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pop(),
          child: Text('Return'),
        ),
      ),
    );
  }
}
