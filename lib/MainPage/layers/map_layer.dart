// https://docs.fleaflet.dev/
// https://www.cnblogs.com/fudong071234/p/10066476.html Mark Point on map.
// https://blog.csdn.net/u012416045/article/details/103556111 The Upper window.
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_wizard/MainPage/layers/map_local_page.dart';

// pages
import 'package:trip_wizard/MainPage/layers/map_location_details.dart';
import 'package:trip_wizard/MainPage/layers/map_location_details2.dart';

import 'dart:convert';

// the map local details' page

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with SingleTickerProviderStateMixin {

  LatLng initialCenter = LatLng(30.307355208294524, 120.38955614353182);
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMap(),
          Column(
            children: [
              Spacer(),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) => const MapLocalPage(),
                            isScrollControlled: true
                        );
                      },
                      child: Row(
                        children: [
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
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        // TODO
                      },
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: (){
                              },
                              icon: const Icon(Icons.edit)
                          ),
                          const Text(
                            '新增地点',
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 2.0, right: 0.0, bottom: 5.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              FloatingActionButton.extended(
                onPressed: () {
                },
                backgroundColor: Colors.white,
                label: const Text(
                  '搜索',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                ),
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 16,
                ),
              ),
              const SizedBox(width: 6,),
              FloatingActionButton.extended(
                onPressed: () {
                },
                backgroundColor: Colors.white,
                label: const Text(
                  '美食',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                ),
                icon: const Icon(
                  Icons.fastfood_rounded,
                  color: Colors.orange,
                  size: 16,
                ),
              ),
              const SizedBox(width: 6,),
              FloatingActionButton.extended(
                onPressed: () {
                },
                backgroundColor: Colors.white,
                label: const Text(
                  '休闲/玩乐',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                ),
                icon: const Icon(
                  Icons.wine_bar,
                  color: Colors.purpleAccent,
                  size: 16,
                ),
              ),
              const SizedBox(width: 6,),
              FloatingActionButton.extended(
                onPressed: () {
                },
                backgroundColor: Colors.white,
                label: const Text(
                  '景点',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                ),
                icon: const Icon(
                  Icons.place,
                  color: Colors.green,
                  size: 16,
                ),
              ),
              const SizedBox(width: 6,),
              FloatingActionButton.extended(
                onPressed: () {
                },
                backgroundColor: Colors.white,
                label: const Text(
                  '购物',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                ),
                icon: const Icon(
                  Icons.shopping_bag,
                  color: Colors.purple,
                  size: 16,
                ),
              ),
            ],
          ),
        )
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future<String> loadString = DefaultAssetBundle.of(context).loadString("assets/localData/MapPlace.json");

    loadString.then((String value){
      setState((){
        data = json.decode(value);
      });
    });
  }

  List<Marker> _buildMakers() {
    List<Marker> tmp = [];
    data["Restaurant"]?.forEach((v){
      tmp.add(Marker(
        point: LatLng(v["Latitude"], v["Longitude"]),
        builder: (context) => Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            )
          ),
          child: IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Details(rating: -999, imgUrl: "https://img.zcool.cn/community/01681f5d2854bfa80120b5abea30e0.jpg@1280w_1l_2o_100sh.jpg", placeName: v["Name"].toString(),)));
            },
            icon: const Icon(
              Icons.restaurant,
              color: Colors.orange,
              size: 13,
            ),
            tooltip: v["Name"],
          ),
        )
      ),
      );
    });
    return tmp;
  }

  Widget _buildMap(){
    return FlutterMap(
          options: MapOptions(
              zoom: 16,
              center: initialCenter
          ),
          nonRotatedChildren: [
            AttributionWidget.defaultWidget(
              source: '高德瓦片地图',
              onSourceTapped: null,
            ),
          ],
          children: [
            TileLayer(// https://tile.openstreetmap.org/{z}/{x}/{y}.png
              urlTemplate: 'https://webrd01.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: _buildMakers(),
            ),
          ],
    );
  }
}
