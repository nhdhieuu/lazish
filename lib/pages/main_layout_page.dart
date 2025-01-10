import 'package:flutter/material.dart';
import 'package:lazish/pages/home_page.dart';
import 'package:lazish/pages/profile_page.dart';
import 'package:lazish/pages/reel.dart';

import 'leaderboard_page.dart';

class MainLayoutPage extends StatefulWidget {
  const MainLayoutPage({Key? key}) : super(key: key);

  @override
  State<MainLayoutPage> createState() => _MainLayoutPageState();
}

class _MainLayoutPageState extends State<MainLayoutPage> {
  int _selectedIndex = 0;

  // Danh sách các màn hình tương ứng với mỗi tab
  final List<Widget> _screens = [
    const Center(child: HomePage()),
    const Center(child: LeaderboardScreen()),
    Center(child: ReelPage()),
    Center(child: ProfilePage()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Thay đổi màu sắc dựa trên tab được chọn
    bool isReelTab = _selectedIndex == 2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isReelTab ? Colors.black : Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: isReelTab ? Colors.white : const Color(0xff6949ff),
        unselectedItemColor: isReelTab ? Colors.grey.shade600 : Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Bảng xếp hạng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_rounded),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
      ),
    );
  }
}
