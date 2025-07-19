import 'package:flutter/material.dart';

import '../extensions/build_context.dart';

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({super.key});

  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  final nameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Person'),
        actions: [
          TextButton(
            onPressed: () {
              print(
                'Name: ${nameController.text}\nHeight: ${heightController.text}\nWeight: ${weightController.text}',
              );
              context.pop();
            },
            child: Text('Save'),
          ),
        ],
        leading: IconButton(onPressed: context.pop, icon: Icon(Icons.close)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                label: Text('Name'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: weightController,
              decoration: InputDecoration(
                label: Text('Weight'),
                border: OutlineInputBorder(),
                suffix: Text('kg'),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: heightController,
              decoration: InputDecoration(
                label: Text('Height'),
                border: OutlineInputBorder(),
                suffix: Text('cm'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
