// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DayCalendarPickerDialog extends StatefulWidget {
  final DateTime initialFromDate;

  final void Function(DateTime fromDate) onSave;

  const DayCalendarPickerDialog({
    Key? key,
    required this.initialFromDate,
    required this.onSave,
  }) : super(key: key);

  @override
  _DayCalendarPickerDialogState createState() =>
      _DayCalendarPickerDialogState();
}

class _DayCalendarPickerDialogState extends State<DayCalendarPickerDialog> {
  late DateTime tempSelectedDateFrom;

  DateTime focusedDate = DateTime.now();

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tempSelectedDateFrom = widget.initialFromDate;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 500,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: const Color(0xff00aff0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DateSelector(
                    label: "Calendar",
                    isSelected: selectedIndex == 0,
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: TableCalendar(
                focusedDay:
                    selectedIndex == 0 ? tempSelectedDateFrom : focusedDate,
                firstDay: DateTime(2000),
                lastDay: DateTime(2100),
                calendarFormat: CalendarFormat.month,
                weekendDays: const [DateTime.sunday],
                selectedDayPredicate: (day) {
                  return isSameDay(day, tempSelectedDateFrom);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    focusedDate = focusedDay;
                    if (selectedIndex == 0) {
                      tempSelectedDateFrom = selectedDay;
                    }
                  });
                },
                calendarStyle: const CalendarStyle(
                  markerDecoration: BoxDecoration(
                    color: Color(0xFF263238),
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Close",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.onSave(tempSelectedDateFrom);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Color(0xff00aff1)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateSelector extends StatelessWidget {
  final String label;

  final bool isSelected;
  final VoidCallback onTap;

  const DateSelector({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
