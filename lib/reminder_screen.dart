import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'reminder_model.dart'; // Import the Reminder model

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final List<Reminder> _reminders = [];
  final TextEditingController _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _addReminder(String title, DateTime dateTime) {
    setState(() {
      _reminders.add(Reminder(title: title, dateTime: dateTime));
    });
    _titleController.clear();
  }

  void _removeReminder(int index) {
    setState(() {
      _reminders.removeAt(index);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade700, Colors.greenAccent.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background image centered
            Container(
              width: 300, // Adjust width as needed
              height: 300, // Adjust height as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-j9bGKeuPie2Yvj42vkVHHnWYgpomof9biA&s'), // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Gradient overlay with UI elements
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Reminder Title',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Select Date'),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (_titleController.text.isNotEmpty) {
                          _addReminder(_titleController.text, _selectedDate);
                        }
                      },
                      child: Text('Add Reminder'),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _reminders.length,
                    itemBuilder: (context, index) {
                      final reminder = _reminders[index];
                      return ListTile(
                        title: Text(reminder.title),
                        subtitle: Text(DateFormat('yyyy-MM-dd').format(reminder.dateTime)),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeReminder(index),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
