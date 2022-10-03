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
  Widget _buildCommentBox() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(18.0)),
      ),
      child: Row(
        children: <Widget> [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/avatar.jpg',
            ),
            radius: 32,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(Title)
                ],
              ),
              Row(
                children: [
                  // TODO
                  // the fancy widget can be download at https://www.getwidget.dev/
                  Icon(Icons.star, color: Colors.redAccent,),
                  Icon(Icons.star, color: Colors.redAccent,),
                  Icon(Icons.star, color: Colors.redAccent,),
                  Icon(Icons.star, color: Colors.redAccent,),
                  Icon(Icons.star, color: Colors.redAccent,),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildComment() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            _buildCommentBox(),
          ],
        ),
      )
    );
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
                Title,
                style: const TextStyle(
                  fontFamily: 'WorkSansSemiBold',
                  color: Colors.white
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
                controller: tabController,
                tabs: const <Widget>[
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
              controller: tabController,
              children: <Widget>[
                Center(child: _buildComment()),
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
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}