import 'package:flutter/material.dart';

import '../extensions/build_context.dart';
import '../models/person_dto.dart';

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({super.key});

  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  final nameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    heightController.dispose();
    weightController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Person'),
        actions: [
          TextButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                final personDto = PersonDto(
                  name: nameController.text,
                  height: int.tryParse(heightController.text) ?? 0,
                  weight: double.tryParse(weightController.text) ?? 0,
                );
                context.pop();
              }
            },
            child: Text('Save'),
          ),
        ],
        leading: IconButton(onPressed: context.pop, icon: Icon(Icons.close)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  label: Text('Full name'),
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty == true) return 'Invalid name';
                  if (value.split(' ').length < 2) return 'Invalid name';
                  for (String n in value.split(' ')) {
                    if (n.isEmpty) return 'Invalid name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: weightController,
                decoration: InputDecoration(
                  label: Text('Weight'),
                  border: OutlineInputBorder(),
                  suffix: Text('kg'),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.isEmpty == true) return 'Invalid weight';
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: heightController,
                decoration: InputDecoration(
                  label: Text('Height'),
                  border: OutlineInputBorder(),
                  suffix: Text('cm'),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.isEmpty == true) return 'Invalid height';
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
