import "package:flutter/material.dart";
import 'package:getwidget/getwidget.dart';

enum DrawerState { CALENDAR, CHANNEL }

class CirclesDrawer extends StatefulWidget {
  const CirclesDrawer({super.key});

  @override
  _CirclesDrawerState createState() => _CirclesDrawerState();
}

class _CirclesDrawerState extends State<CirclesDrawer> {
  DrawerState _drawerState = DrawerState.CHANNEL;

  _drawerStateChange(DrawerState state) {
    setState(() {
      _drawerState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GFDrawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GFDrawerHeader(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/Red_Mountains.png'))),
            currentAccountPicture: const GFAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/images/marry.png'),
            ),
            otherAccountsPictures: const <Widget>[
              Image(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg"),
                fit: BoxFit.cover,
              ),
              GFAvatar(
                child: Text("ab"),
              )
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text('Marray',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text('user@userid.com',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.group_add),
            title: const Text(
                '群组',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                )
            ),
            onTap: ()=>{

            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text(
                '日程',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                )
            ),
            onTap: ()=>{

            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
                '设置',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                )
            ),
            onTap: ()=>{

            },
          ),
        ],
      ),
    );
  }
}
