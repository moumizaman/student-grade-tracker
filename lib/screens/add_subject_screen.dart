import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/subject.dart';
import '../providers/subject_provider.dart';

class AddSubjectScreen extends StatefulWidget {
  const AddSubjectScreen({super.key});

  @override
  State<AddSubjectScreen> createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _markController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _markController.dispose();
    super.dispose();
  }

  void _addSubject() {
    if (_formKey.currentState!.validate()) {
      Provider.of<SubjectProvider>(
        context,
        listen: false,
      ).addSubject(
        Subject(
          name: _nameController.text.trim(),
          mark: double.parse(_markController.text),
        ),
      );

      _nameController.clear();
      _markController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Subject Added Successfully"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [

            Icon(
              Icons.school,
              size: 90,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 15),

            Text(
              "Add New Subject",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 35),

            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Subject Name",
                prefixIcon: Icon(Icons.book),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter subject name";
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: _markController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Marks",
                prefixIcon: Icon(Icons.numbers),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter marks";
                }

                final mark = double.tryParse(value);

                if (mark == null) {
                  return "Invalid number";
                }

                if (mark < 0 || mark > 100) {
                  return "Marks must be between 0 and 100";
                }

                return null;
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _addSubject,
                icon: const Icon(Icons.add),
                label: const Text(
                  "Add Subject",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}