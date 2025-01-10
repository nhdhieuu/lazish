import 'dart:math';

import 'package:flutter/material.dart';

class LeaderBoard {
  final String name;
  final int exp;

  LeaderBoard({required this.name, required this.exp});
}

final Random random = Random();

final List<String> randomNames = [
  'Alex',
  'Charlie',
  'Jordan',
  'Taylor',
  'Morgan',
  'Casey',
  'Jamie',
  'Reese',
  'Peyton',
  'Skyler'
];

final List<LeaderBoard> weeklyData = List.generate(40, (index) {
  final String randomName =
      '${randomNames[random.nextInt(randomNames.length)]} ${random.nextInt(999)}';
  final int randomExp = random.nextInt(1000) + 50; // Từ 50 đến 1049
  return LeaderBoard(name: randomName, exp: randomExp);
});

final List<LeaderBoard> monthlyData = List.generate(40, (index) {
  final String randomName =
      '${randomNames[random.nextInt(randomNames.length)]} ${random.nextInt(999)}';
  final int randomExp = random.nextInt(2000) + 500;
  return LeaderBoard(name: randomName, exp: randomExp);
});

final List<LeaderBoard> allTimeData = List.generate(40, (index) {
  final String randomName =
      '${randomNames[random.nextInt(randomNames.length)]} ${random.nextInt(999)}';
  final int randomExp = random.nextInt(5000) + 1000;
  return LeaderBoard(name: randomName, exp: randomExp);
});

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  String selectedFilter = 'Hàng tuần';
  @override
  void initState() {
    super.initState();
    // Sắp xếp danh sách theo exp giảm dần
    weeklyData.sort((a, b) => b.exp.compareTo(a.exp));
    monthlyData.sort((a, b) => b.exp.compareTo(a.exp));
    allTimeData.sort((a, b) => b.exp.compareTo(a.exp));
  }

  List<LeaderBoard> _getFilteredData() {
    switch (selectedFilter) {
      case 'Hàng tuần':
        return weeklyData;
      case 'Hàng tháng':
        return monthlyData;
      case 'Mọi thời điểm':
        return allTimeData;
      default:
        return weeklyData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset('assets/lazish.png', width: 40, height: 40),
                  const SizedBox(width: 12),
                  const Text(
                    'Bảng xếp hạng',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.search, size: 28),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Filter Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _FilterButton(
                    text: 'Hàng tuần',
                    isSelected: selectedFilter == 'Hàng tuần',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Hàng tuần';
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  _FilterButton(
                    text: 'Hàng tháng',
                    isSelected: selectedFilter == 'Hàng tháng',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Hàng tháng';
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  _FilterButton(
                    text: 'Mọi thời điểm',
                    isSelected: selectedFilter == 'Mọi thời điểm',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Mọi thời điểm';
                      });
                    },
                  ),
                ],
              ),
            ),

            // Leaderboard List
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: ListView.builder(
                  key: ValueKey<String>(
                      selectedFilter), 
                  padding: const EdgeInsets.all(16),
                  itemCount: _getFilteredData().length,
                  itemBuilder: (context, index) {
                    final item = _getFilteredData()[index];
                    return _LeaderboardItem(
                      rank: index + 1,
                      name: item.name,
                      exp: item.exp,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF6949FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Color(0xFF7763FE),
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFF8D75FF),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _LeaderboardItem extends StatelessWidget {
  final int rank;
  final String name;
  final int exp;

  const _LeaderboardItem({
    required this.rank,
    required this.name,
    required this.exp,
  });

  Color _getRankColor() {
    switch (rank) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.grey.shade400;
      case 3:
        return Colors.orange.shade300;
      default:
        return Colors.grey.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // Rank
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _getRankColor().withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                rank.toString(),
                style: TextStyle(
                  color: _getRankColor(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Avatar placeholder (you can replace with actual avatar)
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.shade200,
            child: Icon(Icons.person, color: Colors.grey.shade400),
          ),
          const SizedBox(width: 12),

          // Name
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // XP
          Row(
            children: [
              Image.asset("assets/gem.png", width: 20, height: 20),
              const SizedBox(width: 4),
              SizedBox(
                width: 40,
                child: Text(
                  '$exp',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 2,
          )
          /*Text(
            '$exp',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),*/
        ],
      ),
    );
  }
}
