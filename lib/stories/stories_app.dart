import 'package:flutter/material.dart';
import 'package:gdg_app/universal/dev_scaffold.dart';
import 'package:story_view/story_controller.dart';
import 'package:story_view/story_view.dart';
class StoriesPage extends StatefulWidget {
  static const String routeName = "/stories";
  @override
  _StoriesPageState createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: "About Event",
      body: StoryView(
        [
         /*StoryItem.text(
            "I guess you'd love to see more of our food. That's great.",
            Colors.blue,
          ),
          StoryItem.text(
            "Nice!\n\nTap to continue.",
            Colors.red,
          ),*/
          StoryItem.pageImage(
            NetworkImage(
                "https://scontent.fcmn3-1.fna.fbcdn.net/v/t1.0-9/78733796_2378606438918448_7307251877589024768_o.jpg?_nc_cat=109&_nc_ohc=Rkic7_HeOQcAQk73Epjjle8QmTS2X127AKiS972DL_7yg15EKYbvUTL6g&_nc_ht=scontent.fcmn3-1.fna&oh=a4a819a2cda4c6d20886533bb2016d0e&oe=5E664B75"),
            caption: "GDG Casablanca",
          ),
          StoryItem.pageImage(
            NetworkImage(
                "https://scontent.fcmn3-2.fna.fbcdn.net/v/t1.0-9/78109113_2378607082251717_6936103777648771072_o.jpg?_nc_cat=108&_nc_ohc=j-VAFI9Al8cAQku9dNRB__anksQHzcu7p8ephSKGJKDmXulcenVT1PkPw&_nc_ht=scontent.fcmn3-2.fna&oh=abc3b19e185e357dbaaed9210518831b&oe=5E830395"),
            caption: "GDG Casablanca",
          ),
          StoryItem.pageImage(
            NetworkImage(
                "https://scontent.fcmn3-2.fna.fbcdn.net/v/t1.0-9/79084466_2378607385585020_4260928507653128192_o.jpg?_nc_cat=105&_nc_ohc=2I09IC84C3YAQnRPkQUM7BLR28-m_sfrl_4bT2fYaemqfQ6cGPaS5MtKw&_nc_ht=scontent.fcmn3-2.fna&oh=96c99f27f24c61e0aae651a555f34f92&oe=5E6BC274"),
            caption: "GDG Casablanca",
          ),
          StoryItem.pageImage(
            NetworkImage(
                "https://scontent.fcmn3-2.fna.fbcdn.net/v/t1.0-9/78124202_2378607998918292_3314616400525393920_o.jpg?_nc_cat=101&_nc_ohc=_aFnKjP4GHAAQmCEvk70eFrMDptOVSFWBHOP2htlR87zHYJ4IFVdUD4og&_nc_ht=scontent.fcmn3-2.fna&oh=109e362adba19dce3652513d0863f11d&oe=5E75EDE1"),
            caption: "GDG Casablanca",
          ),
          StoryItem.pageImage(
            NetworkImage(
                "https://scontent.fcmn3-2.fna.fbcdn.net/v/t1.0-9/78833469_2378608182251607_2775404812953452544_o.jpg?_nc_cat=105&_nc_ohc=8ycVgfHxJlkAQlhu3N-aNEW5hTmkhllQZmYXaLlZSh_A-tw7hIn173sJA&_nc_ht=scontent.fcmn3-2.fna&oh=714285744b0087e2fa8051a7f9091e55&oe=5E7F7D75"),
            caption: "GDG Casablanca",
          ),
          StoryItem.pageImage(
            NetworkImage(
                "https://scontent.fcmn3-2.fna.fbcdn.net/v/t1.0-9/78675995_2378612302251195_5107578123470241792_o.jpg?_nc_cat=106&_nc_ohc=UCoyvC-15lsAQnrq81No9W1edwYhw-jUpirh6nZo-BQueQ-m5kbKTIvsg&_nc_ht=scontent.fcmn3-2.fna&oh=a096facc0d607bcd1f564de8e44f8843&oe=5E8380A5"),
            caption: "GDG Casablanca",
          ),
          StoryItem.pageImage(
            NetworkImage(
                "https://scontent.fcmn3-2.fna.fbcdn.net/v/t1.0-9/77294122_2378619968917095_8485114287348514816_o.jpg?_nc_cat=105&_nc_ohc=-WszySvYmckAQlXdFibpMKo9OIcenGHpq_jxnnocN_apT_pA_0ahF2hsw&_nc_ht=scontent.fcmn3-2.fna&oh=cb81b24a786fb49e384435ae82772e6a&oe=5E7A9734"),
            caption: "GDG Casablanca",
          ),
          /*StoryItem.pageGif(
            "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side",
            controller: storyController,
          ),*/

        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
