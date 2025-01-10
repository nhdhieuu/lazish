import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazish/pages/edit_profile_page.dart';
import 'package:lazish/pages/saved_reels_page.dart';
import 'package:lazish/pages/welcome_page.dart';

import '../widgets/chart.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.settings,
                  color: Color(0xFF494949),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(
                  Icons.logout,
                  color: Color(0xFFFA9898),
                ),
                onPressed: () {
                  ElegantNotification.success(
                    title:  Text("Đăng xuất thành công"),
                    description:  Text(" Hẹn gặp lại! "),
                    onDismiss: () {
                      print('Message when the notification is dismissed');
                    },
                  ).show(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset(
                    'assets/avatar.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 21),
              const Text(
                "Phan Châu Hoàng",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Từ 01/11/2024",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              TabBar(
                tabs: [
                  Tab(text: "Thống kê"),
                  Tab(text: "Video đã lưu"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Thống kê tab
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Phan Châu Hoàng",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF555555),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Image.asset("assets/gem.png",
                                      width: 20, height: 20),
                                  const SizedBox(width: 7),
                                  const Text(
                                    "948",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF7A7A7B),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Divider(
                            color: Colors.grey.shade300,
                            height: 1,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                          ),
                          XPChart(),
                        ],
                      ),
                    ),
                    // Video đã lưu tab
                    GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,

                        crossAxisSpacing: 10.0, // Khoảng cách ngang giữa các ô
                        mainAxisSpacing: 10.0, // Khoảng cách dọc giữa các ô
                        childAspectRatio:
                            0.8, // Tỉ lệ giữa chiều rộng và chiều cao của ô
                      ),
                      itemCount: 2,
                      // Placeholder count, replace with actual video count
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SavedReelsPage(
                                  initialIndex: index,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.grey.shade300,
                            child: Image.asset(
                              "assets/thumbnail-${index + 1}.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
