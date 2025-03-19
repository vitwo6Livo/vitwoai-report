// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDatePickerDialog extends StatefulWidget {
  final DateTime initialFromDate;
  final DateTime initialToDate;
  final void Function(DateTime fromDate, DateTime toDate) onSave;

  const CustomDatePickerDialog({
    Key? key,
    required this.initialFromDate,
    required this.initialToDate,
    required this.onSave,
  }) : super(key: key);

  @override
  _CustomDatePickerDialogState createState() => _CustomDatePickerDialogState();
}

class _CustomDatePickerDialogState extends State<CustomDatePickerDialog> {
  late DateTime tempSelectedDateFrom;
  late DateTime tempSelectedDateTo;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tempSelectedDateFrom = widget.initialFromDate;
    tempSelectedDateTo = widget.initialToDate;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 508,
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
                    label: "From",
                    date: tempSelectedDateFrom,
                    isSelected: selectedIndex == 0,
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  Container(
                    height: 50,
                    width: 1,
                    color: Colors.white,
                  ),
                  DateSelector(
                    label: "To",
                    date: tempSelectedDateTo,
                    isSelected: selectedIndex == 1,
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
                child: TableCalendar(
              focusedDay: selectedIndex == 0
                  ? tempSelectedDateFrom
                  : tempSelectedDateTo,
              firstDay: DateTime(2000),
              lastDay: DateTime(2100),
              calendarFormat: CalendarFormat.month,
              weekendDays: const [DateTime.sunday],
              selectedDayPredicate: (day) {
                if (selectedIndex == 0) {
                  return isSameDay(day, tempSelectedDateFrom);
                } else {
                  return isSameDay(day, tempSelectedDateTo);
                }
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  if (selectedIndex == 0) {
                    tempSelectedDateFrom = selectedDay;
                  } else {
                    tempSelectedDateTo = selectedDay;
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
            )),
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
                      widget.onSave(tempSelectedDateFrom, tempSelectedDateTo);
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
  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  const DateSelector({
    Key? key,
    required this.label,
    required this.date,
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
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "${date.toLocal()}".split(' ')[0],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
