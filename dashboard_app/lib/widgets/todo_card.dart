import 'package:flutter/material.dart';
import 'dashboard_card.dart';

class TodoItem {
  final String title;
  bool done;

  TodoItem({required this.title, this.done = false});
}

/// Zweiter Dashboard-Bereich: einfache Aufgabenübersicht mit
/// statischen Beispieldaten (Anzahl offener Aufgaben + Liste).
class TodoCard extends StatefulWidget {
  const TodoCard({super.key});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  final List<TodoItem> _tasks = [
    TodoItem(title: 'Hausübung 2 abgeben'),
    TodoItem(title: 'Wetter-API testen', done: true),
    TodoItem(title: 'README aktualisieren'),
    TodoItem(title: 'Für Klausur lernen'),
  ];

  @override
  Widget build(BuildContext context) {
    final openCount = _tasks.where((t) => !t.done).length;

    return DashboardCard(
      title: 'Aufgaben',
      icon: Icons.checklist_rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$openCount offene Aufgabe${openCount == 1 ? '' : 'n'}',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          ..._tasks.map(
            (task) => CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.done ? TextDecoration.lineThrough : null,
                  color: task.done ? Colors.grey : Colors.black87,
                ),
              ),
              value: task.done,
              onChanged: (value) {
                setState(() {
                  task.done = value ?? false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
