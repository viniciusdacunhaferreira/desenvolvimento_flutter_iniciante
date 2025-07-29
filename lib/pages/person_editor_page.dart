import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../controllers/people_controller.dart';
import '../extensions/build_context.dart';
import '../models/person.dart';
import '../models/person_dto.dart';

class PersonEditorPage extends StatefulWidget {
  const PersonEditorPage({super.key});

  @override
  State<PersonEditorPage> createState() => _PersonEditorPageState();
}

class _PersonEditorPageState extends State<PersonEditorPage> {
  final nameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final peopleController = GetIt.instance<PeopleController>();

  bool editorMode = false;

  Person? person;

  @override
  void didChangeDependencies() {
    person = ModalRoute.of(context)!.settings.arguments as Person?;

    if (person != null) {
      editorMode = true;
      nameController.text = person!.name;
      heightController.text = person!.height.toString();
      weightController.text = person!.weight.toString();
    }

    super.didChangeDependencies();
  }

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
        title: Text(!editorMode ? 'Add Person' : "Edit Person"),
        actions: [
          TextButton(
            onPressed: () async {
              if (formKey.currentState?.validate() ?? false) {
                if (!editorMode) {
                  final personDto = PersonDto(
                    name: nameController.text,
                    weight: double.tryParse(weightController.text) ?? 0,
                    height: int.tryParse(heightController.text) ?? 0,
                  );
                  await peopleController.addPerson(personDto);
                  if (context.mounted) context.pop();
                } else {
                  final editedPerson = person!.copyWith(
                    name: nameController.text,
                    weight: double.tryParse(weightController.text) ?? 0,
                    height: int.tryParse(heightController.text) ?? 0,
                  );
                  await peopleController.editPerson(editedPerson);
                  if (context.mounted) context.pop();
                }
              }
            },
            child: Text('Save'),
          ),
        ],
        leading: IconButton(onPressed: context.pop, icon: Icon(Icons.close)),
      ),
      body: SingleChildScrollView(
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixText: 'kg',
                  labelText: 'Weight',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.isEmpty == true) return 'Invalid weight';
                  if (double.tryParse(value!) == null) return 'Invalid weight';
                  return null;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}')),
                ],
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixText: 'cm',
                  labelText: 'Height',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.isEmpty == true) return 'Invalid height';
                  if (int.tryParse(value!) == null) return 'Invalid weight';
                  return null;
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
