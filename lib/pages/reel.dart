import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lazish/widgets/content_screen.dart';

class ReelPage extends StatefulWidget {
  final List<String> videos = [
    'https://stream.hiholive.fun/reel1.mp4?fbclid=IwZXh0bgNhZW0CMTEAAR1w7hkxaruvmkGQZioJE3Hy5xv6jhuau9yGEhv5x7WQT8VkA_xQkHa4S7M_aem_Aa5KP1eYTT9Ib6QQM0lzVQ',
    'https://stream.hiholive.fun/reel2.mp4?fbclid=IwZXh0bgNhZW0CMTEAAR20LMTsDlF_W1B4dw-F9ZW67Z2Aq8mSGjLkUubkpR163XC6VTB7U_K2QEw_aem_KhccRMCsM-FbKLxlUSRTfQ',
    'https://static.vecteezy.com/system/resources/previews/002/140/013/mp4/waterfall-in-a-wild-nature-free-video.mp4',
    'https://static.vecteezy.com/system/resources/previews/032/506/386/mp4/teacher-teaching-her-girl-student-the-alphabet-video.mp4',
  ];

  ReelPage({super.key});

  @override
  State<ReelPage> createState() => _ReelPageState();
}

class _ReelPageState extends State<ReelPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 40,
        
        backgroundColor: Colors.transparent, // Để AppBar trong suốt
        automaticallyImplyLeading: true, // Bật nút back tự động
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'English Reels',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
         // Căn giữa title
      ),
      body: Stack(
        children: [
          //We need swiper for every content
          Swiper(
            onIndexChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return ContentScreen(
                src: widget.videos[index],
                isVisible: _currentPage == index,
              );
            },
            itemCount: widget.videos.length,
            scrollDirection: Axis.vertical,
            loop: false, // Không cho phép lặp
            autoplay: false, // Không tự động phát
          ),
        ],
      ),
    );
  }
}
