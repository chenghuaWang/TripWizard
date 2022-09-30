import 'package:flutter/material.dart';

class MapLocationDetails extends StatefulWidget {
  MapLocationDetails(this.Title, {super.key});

  String Title = "";

  @override
  _MapLocationState createState() => _MapLocationState(Title);
}

class _MapLocationState extends State<MapLocationDetails> with SingleTickerProviderStateMixin {

  String Title = "";
  late TabController tabController;

  _MapLocationState(this.Title);

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
                Title,
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
            delegate: MapStickyTabBarDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: this.tabController,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      '评价',
                      style: TextStyle(
                          color: Colors.teal
                      ),
                    ),
                  ),
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

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}

class MapStickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  MapStickyTabBarDelegate({required this.child});

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