import 'package:flutter/material.dart';
import 'package:trip_wizard/MainPage/utils/const.dart';

class UsrDetails extends StatefulWidget {
  const UsrDetails({super.key});

  @override
  _UsrDetailsState createState() => _UsrDetailsState();
}

class _UsrDetailsState extends State<UsrDetails> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 250,
            backgroundColor: Colors.teal,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Gloria',
                style: TextStyle(
                  fontFamily: 'WorkSansSemiBold'
                ),
              ),
              background: Image(
                image: AssetImage('assets/images/avatar.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: this.tabController,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      '动态',
                      style: TextStyle(
                        color: Colors.teal
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '创作',
                      style: TextStyle(
                          color: Colors.teal
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '群组',
                      style: TextStyle(
                          color: Colors.teal
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                Center(child: Text('Content of Home')),
                Center(child: Text('Content of Profile')),
                Center(child: Text('Content of Profile')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}