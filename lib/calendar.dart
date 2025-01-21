import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Syncfusion Calendar")),
      body: SfCalendar(
        view: CalendarView.month, // Display month view
        dataSource: MeetingDataSource(_getDataSource()), // Appointments
        initialSelectedDate: DateTime.now(),
        monthViewSettings: MonthViewSettings(
          showAgenda: true, // Shows the agenda below the month view
        ),
      ),
    );
  }

  // Data source for calendar appointments
  List<Meeting> _getDataSource() {
    return <Meeting>[
      Meeting(
        'Team Meeting',
        DateTime(2024, 11, 21, 10, 0),
        DateTime(2024, 11, 21, 12, 0),
        Colors.blue,
        false,
      ),
      Meeting(
        'Project Deadline',
        DateTime(2024, 11, 23, 9, 0),
        DateTime(2024, 11, 23, 11, 0),
        Colors.red,
        false,
      ),
    ];
  }
}

// Data model for an appointment
class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

// DataSource to link appointments to the calendar
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
