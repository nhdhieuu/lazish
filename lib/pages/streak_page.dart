import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ChallengeContent extends StatefulWidget {
  const ChallengeContent({Key? key}) : super(key: key);

  @override
  State<ChallengeContent> createState() => _ChallengeContentState();
}

class _ChallengeContentState extends State<ChallengeContent> {
  late Set<DateTime> _highlightedDays;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    // Generate last 4 days including today, with time part removed
    _highlightedDays = List.generate(4, (i) {
      final date = DateTime.now().subtract(Duration(days: i));
      return DateTime(date.year, date.month, date.day);
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildCalendar(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Chuỗi (ngày)',
          style: TextStyle(
            color: Color(0xFF585859),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Image.asset(
              'assets/fire.png',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 5),
            const Text(
              '4 ngày',
              style: TextStyle(
                color: Color(0xFF868687),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime(2025, 1),
      lastDay: DateTime(2025, 12),
      focusedDay: _focusedDay,
      currentDay: DateTime.now(),
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
        defaultTextStyle: TextStyle(color: Colors.black),
        outsideDaysVisible: false,
      ),
      selectedDayPredicate: (day) {
        // Remove time part for comparison
        final dateOnly = DateTime(day.year, day.month, day.day);
        return _highlightedDays.contains(dateOnly);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
        });
      },
    );
  }
}