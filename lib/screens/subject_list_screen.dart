import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectProvider>(
      builder: (context, provider, child) {
        if (provider.subjects.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school_outlined,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 20),
                Text(
                  "No Subjects Added Yet",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Go to the Add screen and add your first subject.",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: provider.subjects.length,
          itemBuilder: (context, index) {
            final subject = provider.subjects[index];

            return Dismissible(
              key: Key(subject.name + index.toString()),

              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),

              onDismissed: (_) {
                provider.deleteSubject(index);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${subject.name} deleted"),
                  ),
                );
              },

              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                    Theme.of(context).colorScheme.primary,
                    child: Text(
                      subject.grade,
                      style: TextStyle(
                        color:
                        Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  title: Text(
                    subject.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                      Theme.of(context).colorScheme.onSurface,
                    ),
                  ),

                  subtitle: Text(
                    "Marks : ${subject.mark}",
                    style: TextStyle(
                      color:
                      Theme.of(context).colorScheme.onSurface,
                    ),
                  ),

                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color:
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}