import 'package:flutter/material.dart';
import '../models/subject.dart';

class SubjectProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];

  List<Subject> get subjects => _subjects;

  void addSubject(Subject subject) {
    _subjects.add(subject);
    notifyListeners();
  }

  void deleteSubject(int index) {
    _subjects.removeAt(index);
    notifyListeners();
  }

  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) return 0;

    double total = _subjects.fold(
      0,
          (sum, subject) => sum + subject.mark,
    );

    return total / _subjects.length;
  }

  String get overallGrade {
    if (averageMark >= 80) return "A";
    if (averageMark >= 65) return "B";
    if (averageMark >= 50) return "C";
    return "F";
  }

  // Assignment requirement: use .where()
  List<Subject> get passingSubjects =>
      _subjects.where((subject) => subject.mark >= 50).toList();
}