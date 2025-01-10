import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:lazish/widgets/content_screen.dart';

class SavedReelsPage extends StatefulWidget {
  final List<String> videos = [
    'https://stream.hiholive.fun/reel1.mp4?fbclid=IwZXh0bgNhZW0CMTEAAR1w7hkxaruvmkGQZioJE3Hy5xv6jhuau9yGEhv5x7WQT8VkA_xQkHa4S7M_aem_Aa5KP1eYTT9Ib6QQM0lzVQ',
    'https://stream.hiholive.fun/reel2.mp4?fbclid=IwZXh0bgNhZW0CMTEAAR20LMTsDlF_W1B4dw-F9ZW67Z2Aq8mSGjLkUubkpR163XC6VTB7U_K2QEw_aem_KhccRMCsM-FbKLxlUSRTfQ',
  ];
  final int initialIndex;

  SavedReelsPage({super.key, this.initialIndex = 0});

  @override
  State<SavedReelsPage> createState() => _SavedReelsPageState();
}

class _SavedReelsPageState extends State<SavedReelsPage> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
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
      ),
      body: Stack(
        children: [
          Swiper(
            index: _currentPage,
            onIndexChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return ContentScreen(
                src: widget.videos[index],
                isVisible: _currentPage == index,
                isSaved: true,
              );
            },
            itemCount: widget.videos.length,
            scrollDirection: Axis.vertical,
            loop: false,
            autoplay: false,
          ),
        ],
      ),
    );
  }
}