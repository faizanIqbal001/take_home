import 'package:take_home/export.dart';

class TaskWidget extends StatefulWidget {
  final String title;
  final String description;
  final int priority;

  const TaskWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.priority});

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  String _selectedSection = 'To Do';

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(widget.description),
            const SizedBox(height: 16.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              DropdownButton<String>(
                value: _selectedSection,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSection = newValue!;
                  });
                },
                items: <String>['To Do', 'In Progress', 'Done']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Row(
                children: [
                  const Text(
                    "Priority: ",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    widget.priority == 1
                        ? "Low"
                        : widget.priority == 2
                            ? "Average"
                            : widget.priority == 3
                                ? "High"
                                : widget.priority == 4
                                    ? "Urgent"
                                    : "None",
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
