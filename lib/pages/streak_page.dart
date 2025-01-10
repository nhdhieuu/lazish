import 'package:flutter/material.dart';


class ChallengeContent extends StatelessWidget {
  const ChallengeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Progress
          _buildHeader(),
          const SizedBox(height: 20),
          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(2025, 1),
            lastDate: DateTime(2025, 12),
            onDateChanged: (date) {
            },
          ),
          // Calendar
          /*_buildCalendar(),*/
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Text(
          'Chuỗi (ngày)',
          style: TextStyle(
            color: Color(0xFF585859),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children:[
            Image.asset(
              'assets/fire.png',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 5),
            Text(
              '4 ngày',
              style: TextStyle(
                color: Color(0xFF868687),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ]
        )
      ],
    );
  }



  Widget _buildInfoCards() {
    return Row(
      children: [
        Expanded(
          child: _buildInfoCard(
            icon: Icons.local_fire_department,
            iconColor: Colors.deepOrange,
            backgroundColor: Colors.deepOrange[50]!,
            title: '4 days',
            subtitle: 'challenge done',
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: _buildInfoCard(
            icon: Icons.calendar_today,
            iconColor: Colors.blue,
            backgroundColor: Colors.blue[50]!,
            title: '10 days',
            subtitle: 'remaining',
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
