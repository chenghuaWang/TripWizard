import 'package:flutter/material.dart';

class SocialHotDetails extends StatefulWidget {
  const SocialHotDetails({super.key});

  @override
  _SocialHotDetailsState createState() => _SocialHotDetailsState();
}

class _SocialHotDetailsState extends State<SocialHotDetails>
    with SingleTickerProviderStateMixin{

  final int MaxItem = 20;
  final int MaxHotPlaceItem = 10;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.red,
                  ),
                  Text(
                    '时下最火热之地!!!',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.blueGrey
                    ),
                  ),
                ],
              ),
            ),
            _buildHotPlace(),
            Column(
              children: _buildAllHotItem(),
            ),
          ],
        )
      ),
    );
  }

  List<Widget> _buildAllHotItem() {
    List<Widget> tmp = [];
    for (int i = 1; i <= MaxItem; ++i) {
      tmp.add(_buildSingleItem(i));
    }
    return tmp;
  }

  Widget _buildHotPlace() {
    List<Widget> tmp = [];

    for (int i = 0; i < MaxHotPlaceItem; ++i) {
      tmp.add(
        CircleAvatar(
          backgroundImage: AssetImage(
            'assets/images/avatar.jpg',
          ),
          radius: 24,
        ),
      );
      tmp.add(
        SizedBox(width: 12,),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: tmp,
        ),
      ),
    );
  }

  Widget _buildSingleItem(int index) {
    Color NumberColor = Colors.black45;
    if (index <= 3) {
      NumberColor = Colors.deepOrange;
    }

    return Container(
      height: 64,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: const BoxDecoration(
        color: Color(0xFFFCFCFF),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                index.toString(),
                style: TextStyle(
                  color: NumberColor,
                  fontFamily: 'WorkSansBold',
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Image(
                image: AssetImage('assets/images/avatar.jpg'),
                width: 45,
                height: 32,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                children: [
                  Text(
                    'HEHEHEHEHE',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'WorkSansBold',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'HEHEHEHEHE',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'WorkSansBold',
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          const Divider(height: 1, color: Colors.grey,)
        ],
      )
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}