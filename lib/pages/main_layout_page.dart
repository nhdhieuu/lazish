import 'package:flutter/material.dart';
import 'package:lazish/pages/exercise_page.dart';
import 'package:lazish/pages/home_page.dart';


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
    const Center(child:ExercisePage()),
    Center(child: Text("abc")),
    const Center(child: Text("abc")),
    const Center(child: Text("abc")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed, // Hiển thị tất cả các items
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff6949ff),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Thử thách',
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