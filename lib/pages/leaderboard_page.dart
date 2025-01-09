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

final List<LeaderBoard> leaderBoardData = List.generate(40, (index) {
  final String randomName =
      '${randomNames[random.nextInt(randomNames.length)]} ${random.nextInt(999)}';
  final int randomExp = random.nextInt(1000) + 50; // Từ 50 đến 1049
  return LeaderBoard(name: randomName, exp: randomExp);
});

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  void initState() {
    super.initState();
    // Sắp xếp danh sách theo exp giảm dần
    leaderBoardData.sort((a, b) => b.exp.compareTo(a.exp));
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
                    isSelected: true,
                    onTap: () {},
                  ),
                  const SizedBox(width: 12),
                  _FilterButton(
                    text: 'Hàng tháng',
                    isSelected: false,
                    onTap: () {},
                  ),
                  const SizedBox(width: 12),
                  _FilterButton(
                    text: 'Mọi thời điểm',
                    isSelected: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // Leaderboard List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: leaderBoardData.length,
                itemBuilder: (context, index) {
                  final item = leaderBoardData[index];
                  return _LeaderboardItem(
                    rank: index + 1,
                    name: item.name,
                    exp: item.exp,
                  );
                },
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
              color: _getRankColor().withOpacity(0.2),
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
              Text(
                '$exp',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
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
