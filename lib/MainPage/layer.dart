import 'package:flutter/material.dart';
import 'package:trip_wizard/MainPage/widget/icon_badge.dart';

// import other layers.
import 'package:trip_wizard/MainPage/layers/home_layer.dart';
import 'package:trip_wizard/MainPage/layers/video_layer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        // children: List.generate(4, (index) => const Home()),
        children: const [
          Home(),
          VideoPage(),
          Home(),
          Home(),
        ]
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(width: 7.0),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                barIcon(icon: Icons.home, page: 0, tip: "主页"),
                const Text("主页",
                    style: TextStyle(color: Colors.black54,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 7,),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                barIcon(icon: Icons.video_library, page: 1, tip: "旅拍"),
                const Text("旅拍",
                    style: TextStyle(color: Colors.black54,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 7,),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                barIcon(icon: Icons.question_answer, page: 2, badge: false, tip: "社区"),
                const Text("社区",
                    style: TextStyle(color: Colors.black54,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 7,),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                barIcon(icon: Icons.person, page: 3, tip: "个人主页"),
                const Text("个人主页",
                    style: TextStyle(color: Colors.black54,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 7,),
              ],
            ),
            const SizedBox(width: 7.0),
          ],
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  Widget barIcon(
      {IconData icon = Icons.home, int page = 0, bool badge = false, String tip=''}) {
    return IconButton(
      icon: badge ? IconBadge(icon: icon, size: 24.0) : Icon(icon, size: 24.0),
      color:
      _page == page ? Colors.teal : Theme.of(context).colorScheme.secondary,
      onPressed: () {
        _pageController.jumpToPage(page);
      },
      tooltip: tip,
    );
  }
}