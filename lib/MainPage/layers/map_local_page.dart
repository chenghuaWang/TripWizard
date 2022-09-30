import 'package:flutter/material.dart';

class MapLocalPage extends StatefulWidget {
  const MapLocalPage({super.key});

  @override
  _MapLocalPageState createState() => _MapLocalPageState();
}

class _MapLocalPageState extends State<MapLocalPage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 20,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: (){
                      },
                      icon: const Icon(Icons.upcoming)
                  ),
                  const Text(
                    '杭州 吃喝玩乐推荐',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              _buildDetials(),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildDetials() {
    return Column(
      children: [
        _buildEatWhere(),
        _buildPlayWhere(),
        _buildLiveWhere(),
      ],
    );
  }

  Widget _buildEatWhere() {
    return Container(

    );
  }

  Widget _buildPlayWhere() {
    return Container(

    );
  }

  Widget _buildLiveWhere() {
    return Container(

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