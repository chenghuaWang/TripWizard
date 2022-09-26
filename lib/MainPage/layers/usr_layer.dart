import 'package:flutter/material.dart';

import 'package:trip_wizard/MainPage/layers/usr_detail.dart';

class UsrPage extends StatefulWidget {
  const UsrPage({super.key});

  @override
  _UsrPageState createState() => _UsrPageState();
}

class _UsrPageState extends State<UsrPage> with SingleTickerProviderStateMixin{

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( //SingleChildScrollView
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
                          style: ButtonStyle(
                          ),
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
                            color: Colors.teal
                        ),
                      ),
                      Text(
                        '获赞',
                        style: TextStyle(
                            fontFamily: 'WorkSansSemiBold',
                            fontSize: 12,
                            color: Colors.black
                        ),
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
                            color: Colors.teal
                        ),
                      ),
                      Text(
                        '被关注',
                        style: TextStyle(
                            fontFamily: 'WorkSansSemiBold',
                            fontSize: 12,
                            color: Colors.black
                        ),
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
                            color: Colors.teal
                        ),
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
                      Row(
                        children: [
                          SizedBox(
                            width: 12,
                            height: 0,
                          ),
                          Icon(Icons.group, color: Colors.teal,),
                          SizedBox(
                            width: 12,
                            height: 0,
                          ),
                          Text(
                              '加入的群组'
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 12,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5.0),
                              height: 20.0,
                              width: 80.0,
                              child: Text(
                                'test',
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5.0),
                              height: 20.0,
                              width: 80.0,
                              child: Text('test'),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5.0),
                              height: 20.0,
                              width: 80.0,
                              child: Text('test'),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5.0),
                              height: 20.0,
                              width: 80.0,
                              child: Text('test'),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5.0),
                              height: 20.0,
                              width: 80.0,
                              child: Text('test'),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5.0),
                              height: 20.0,
                              width: 80.0,
                              child: Text('test'),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5.0),
                              height: 20.0,
                              width: 80.0,
                              child: Text('test'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              )
              // TODO add 打卡，勋章墙，加入的群组
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_)=>UsrDetails())
            );
          },
          backgroundColor: Colors.transparent,
          label: Text(
            '详细信息',
          ),
          icon: Icon(Icons.arrow_right),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop
      );
  }
}
