import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:trip_wizard/flat_widgets/flat_action_btn.dart';
import 'package:trip_wizard/flat_widgets/flat_add_story_btn.dart';
import 'package:trip_wizard/flat_widgets/flat_chat_item.dart';
import 'package:trip_wizard/flat_widgets/flat_counter.dart';
import 'package:trip_wizard/flat_widgets/flat_page_header.dart';
import 'package:trip_wizard/flat_widgets/flat_page_wrapper.dart';
import 'package:trip_wizard/flat_widgets/flat_profile_image.dart';
import 'package:trip_wizard/flat_widgets/flat_section_header.dart';

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

  Widget _buildDo() {
    List<Widget> tmp = [];
    for(int i = 0; i < 20; ++i) {
      tmp.add(
          GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.start,
            image: Image.asset(
              'assets/images/4090.jfif',
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            showImage: true,
            title: GFListTile(
              avatar: GFAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              titleText: 'Game Controllers',
              subTitleText: 'PlayStation 5',
            ),
            content: Text("PS 5 is awesome, but 4090 is better!!!"),
          )
      );
    }
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: tmp,
        ),
      ),
    );
  }

  Widget _buildArticle() {
    List<Widget> tmp = [];
    for (int i =0; i < 20; ++i) {
      tmp.add(
        GFCard(
          boxFit: BoxFit.cover,
          image: Image.asset(
            "assets/images/Magical_World.png",
            fit: BoxFit.cover,
          ),
          title: GFListTile(
            avatar: GFAvatar(
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
            ),
            title: Text('Title'),
            subTitle: Text('Sub Title'),
          ),
          content: Text("Some Cards"),
          buttonBar: GFButtonBar(
            children: <Widget>[
              GFButton(
                onPressed: () {},
                text: 'READ',
                color: Colors.teal,
              ),
              GFButton(
                onPressed: () {},
                text: 'STAR',
                color: Colors.teal,
              ),
            ],
          ),
        ),
      );
    }
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: tmp,
        ),
      ),
    );
  }

  Widget _buildGroup() {
    List<Widget> tmp = [];
    for (int i = 0; i< 20; ++i ){
      tmp.add(
        FlatChatItem(
          profileImage: FlatProfileImage(
            onlineIndicator: true,
            imageUrl: "https://images.unsplash.com/photo-1558392204-ac78741f4abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
          ),
          nameColor: Colors.black,
          messageColor: Colors.grey,
          name: "And Sister",
          backgroundColor: Colors.white,
        ),
      );
    }
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: tmp,
        ),
      ),
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
                    child: Container(
                      child: Text(
                        '动态',
                        style: TextStyle(
                          color: Colors.teal,
                        ),
                      ),
                    )
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
                Center(child: _buildDo()),
                Center(child: _buildArticle()),
                Center(child: _buildGroup()),
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