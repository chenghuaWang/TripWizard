import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:trip_wizard/MainPage/layers/usr_detail.dart';
import 'package:trip_wizard/flat_widgets/flat_add_story_btn.dart';
import 'package:trip_wizard/flat_widgets/flat_profile_image.dart';
import 'package:trip_wizard/flat_widgets/flat_section_header.dart';

import 'package:getwidget/getwidget.dart';

class UsrPage extends StatefulWidget {
  const UsrPage({super.key});

  @override
  _UsrPageState createState() => _UsrPageState();
}

class _UsrPageState extends State<UsrPage> with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  List<Widget> _buildBadge() {
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
    return tmp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          //SingleChildScrollView
          // padding: const EdgeInsets.symmetric(horizontal: 10),
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/profile_bk.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 60),
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/avatar.jpg',
                      ),
                      radius: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Gloria',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: 'WorkSansSemiBold',
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "都是风景，幸会",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'WorkSansSemiBold',
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextButton(
                          child: Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                          style: ButtonStyle(),
                          onPressed: () {},
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          child: Icon(
                            Icons.add_box_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: [
                  Column(
                    children: [
                      Text(
                        '7748',
                        style: TextStyle(
                            fontFamily: 'WorkSansSemiBold',
                            fontSize: 28,
                            color: Colors.teal),
                      ),
                      Text(
                        '获赞',
                        style: TextStyle(
                            fontFamily: 'WorkSansSemiBold',
                            fontSize: 12,
                            color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '1145',
                        style: TextStyle(
                            fontFamily: 'WorkSansSemiBold',
                            fontSize: 28,
                            color: Colors.teal),
                      ),
                      Text(
                        '被关注',
                        style: TextStyle(
                            fontFamily: 'WorkSansSemiBold',
                            fontSize: 12,
                            color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '692',
                        style: TextStyle(
                            fontFamily: 'WorkSansSemiBold',
                            fontSize: 28,
                            color: Colors.teal),
                      ),
                      Text(
                        '讨论组',
                        style: TextStyle(
                          fontFamily: 'WorkSansSemiBold',
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 24,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFCFCFF),
                      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8)],
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 0,
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 12,
                        ),
                        FlatSectionHeader(
                          title: "加入的群组",
                          textColor: Colors.teal,
                        ),
                        Container(
                          height: 76.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 16.0,
                          ),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 16.0,
                                ),
                                child: FlatAddStoryBtn(),
                              ),
                              FlatProfileImage(
                                imageUrl:
                                    "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
                                onlineIndicator: true,
                                outlineIndicator: true,
                              ),
                              FlatProfileImage(
                                outlineIndicator: true,
                                onlineIndicator: true,
                                imageUrl:
                                    "https://images.unsplash.com/photo-1502323777036-f29e3972d82f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
                              ),
                              FlatProfileImage(
                                outlineIndicator: true,
                                imageUrl:
                                    "https://images.unsplash.com/photo-1582721244958-d0cc82a417da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2179&q=80",
                              ),
                              FlatProfileImage(
                                onlineIndicator: true,
                                outlineIndicator: true,
                                imageUrl:
                                    "https://images.unsplash.com/photo-1583243567239-3727551e0c59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1112&q=80",
                              ),
                              FlatProfileImage(
                                outlineIndicator: true,
                              ),
                              FlatProfileImage(
                                outlineIndicator: true,
                              ),
                              FlatProfileImage(
                                outlineIndicator: true,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              // TODO add 打卡，勋章墙，加入的群组
            ] + _buildBadge(),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => UsrDetails()));
          },
          backgroundColor: Colors.transparent,
          label: Text(
            '详细信息',
          ),
          icon: Icon(Icons.arrow_right),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop);
  }
}
