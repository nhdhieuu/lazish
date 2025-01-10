import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  final Function()? onLikePressed;
  final Function()? onDownloadPressed;
  final bool isLiked;

  const OptionsScreen({
    Key? key,
    this.onLikePressed,
    this.onDownloadPressed,
    this.isLiked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 110),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person,
                            size: 18, color: Colors.white), // Icon color
                        radius: 16,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'lazish_app',
                        style: TextStyle(color: Colors.white), // Text color
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.verified,
                          size: 15, color: Colors.white), // Icon color
                      SizedBox(width: 6),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white, // Text color
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 6),
                  Text(
                    'English is wonderful 💙❤💛 ..',
                    style: TextStyle(color: Colors.white), // Text color
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 15,
                        color: Colors.white, // Icon color
                      ),
                      Text(
                        'Original Audio - Original Music',
                        style: TextStyle(color: Colors.white), // Text color
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: onLikePressed,
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_outline,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '601k',
                    style: TextStyle(color: Colors.white), // Text color
                  ),
                  SizedBox(height: 20),
                  Icon(Icons.bookmark_border, color: Colors.white), // Icon color
                  Text(
                    '1123',
                    style: TextStyle(color: Colors.white), // Text color
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
