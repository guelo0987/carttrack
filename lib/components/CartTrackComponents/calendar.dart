import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  final DateTime? selectedDay;
  final Function(DateTime, DateTime)? onDaySelected;
  final DateTime firstDay;
  final DateTime lastDay;

  const CustomCalendar({
    Key? key,
    this.selectedDay,
    this.onDaySelected,
    required this.firstDay,
    required this.lastDay,
  }) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late DateTime _focusedDay;
  late DateTime? currentDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    // Set _focusedDay based on the current date
    if (now.isBefore(widget.firstDay)) {
      _focusedDay = widget.firstDay;
    } else if (now.isAfter(widget.lastDay)) {
      _focusedDay = widget.lastDay;
    } else {
      _focusedDay = now;
    }
    // Set currentDay only if it falls within the range, otherwise null
    currentDay = (now.isAfter(widget.firstDay) && now.isBefore(widget.lastDay))
        ? now
        : null;
    _selectedDay = widget.selectedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFC8DCEA),
            offset: Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: TableCalendar(
        firstDay: widget.firstDay,
        lastDay: widget.lastDay,
        focusedDay: _focusedDay,
        currentDay: currentDay,
        calendarFormat: _calendarFormat,
        availableGestures: AvailableGestures.none,
        rowHeight: 35,
        availableCalendarFormats: const {
          CalendarFormat.month: 'Mes',
        },
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            if (widget.onDaySelected != null) {
              widget.onDaySelected!(selectedDay, focusedDay);
            }
          }
        },
        headerStyle: const HeaderStyle(
          titleTextStyle: TextStyle(
            color: Color(0xFF0500C6),
            fontSize: 20,
            fontFamily: 'Mundial',
            fontWeight: FontWeight.bold,
          ),
          formatButtonVisible: false,
          leftChevronIcon: Icon(Icons.chevron_left, color: Color(0xFF0500C6)),
          rightChevronIcon: Icon(Icons.chevron_right, color: Color(0xFF0500C6)),
          titleCentered: true,
          headerPadding: EdgeInsets.symmetric(vertical: 8),
          headerMargin: EdgeInsets.zero,
        ),
        calendarStyle: CalendarStyle(
          cellMargin: EdgeInsets.all(0),
          selectedDecoration: const BoxDecoration(
            color: Color(0xFF0500C6),
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: const Color(0xFF0500C6).withAlpha(51),
            shape: BoxShape.circle,
          ),
          weekendTextStyle: const TextStyle(color: Colors.black, fontSize: 14),
          defaultTextStyle: const TextStyle(color: Colors.black, fontSize: 14),
          outsideDaysVisible: false,
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Mundial',
              fontWeight: FontWeight.bold,
              fontSize: 14),
          weekendStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Mundial',
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
      ),
    );
  }
}
