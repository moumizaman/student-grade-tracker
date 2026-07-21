import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(
                "Result Summary",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(height: 25),

              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.menu_book,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text("Total Subjects"),
                  trailing: Text(
                    provider.totalSubjects.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.calculate,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text("Average Mark"),
                  trailing: Text(
                    provider.averageMark.toStringAsFixed(2),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.emoji_events,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text("Overall Grade"),
                  trailing: Text(
                    provider.overallGrade,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text("Passing Subjects"),
                  trailing: Text(
                    provider.passingSubjects.length.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}