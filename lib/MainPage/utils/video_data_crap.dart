import 'dart:math';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/services.dart';

Random random = Random();

typedef UrlStr = String;

class VideoDataPayload {
  // Below for u to setting.
 late String upName;
 late UrlStr upAvatarUrl;
 late String upNumber;
 late UrlStr videoHeadPicUrl;
 late UrlStr videoStreamUrl;
 late String videoId;
 late String location;
 late String city;

 // Below is automatic generated.
 int likes = 0;
 int comments = 0;

 VideoDataPayload(
     this.upName,
     this.upAvatarUrl,
     this.upNumber,
     this.videoHeadPicUrl,
     this.videoStreamUrl,
     this.videoId,
     this.location,
     this.city
 );
}

class VideoDataMaintainer {
  List<VideoDataPayload> _data = <VideoDataPayload>[];

  VideoDataMaintainer(){
    pushData(VideoDataPayload(
        "索尼音乐中国",
        "https://i2.hdslb.com/bfs/face/459425ffc7f0c9c12976fb678c34734462be8ab7.jpg@240w_240h_1c_1s.webp",
        "486906719",
        "https://i1.hdslb.com/bfs/archive/5242750857121e05146d5d5b13a47a2a6dd36e98.jpg",
        '''
        <iframe src="https://player.bilibili.com/player.html?aid=80433022&bvid=BV1GJ411x7h7&cid=137649199&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>
        ''',
        "BV1GJ411x7h7",
        "American",
        "I don't know where, actually. :-("
    ));
    pushData(VideoDataPayload(
        "kumiko想要学分析",
        "https://i2.hdslb.com/bfs/face/90ac97eb1f0924950f34067d88863eb0026d9e72.jpg@240w_240h_1c_1s.webp",
        "3156848",
        "https://i2.hdslb.com/bfs/archive/80a31a780a9e339c13acfc612385dc24af31020e.jpg",
        '''
        <iframe src="https://player.bilibili.com/player.html?aid=473691803&bvid=BV16T411K7Bw&cid=850552551&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>
        ''',
        "BV16T411K7Bw",
        "China",
        "SuZhou University"
    ));
    pushData(VideoDataPayload(
        "楊大人世界跳",
        "https://i0.hdslb.com/bfs/face/35996aaeb5579ccba8c8b1ebb016cd2c890831aa.jpg@240w_240h_1c_1s.webp",
        "592320330",
        "https://i0.hdslb.com/bfs/archive/50aded22a845cbca91cf81635571484637c3a484.jpg",
        '''
        <iframe src="https://player.bilibili.com/player.html?aid=516152581&bvid=BV1ug411v78s&cid=850739502&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>
        ''',
        "BV1ug411v78s",
        "Australia",
        "Sidney"
    ));
    pushData(VideoDataPayload(
        "楊大人世界跳",
        "https://i0.hdslb.com/bfs/face/35996aaeb5579ccba8c8b1ebb016cd2c890831aa.jpg@240w_240h_1c_1s.webp",
        "592320330",
        "https://i1.hdslb.com/bfs/archive/bef5a42046a9f1f8964e2bfe4a768918898d382b.jpg",
        '''
        <iframe src="https://player.bilibili.com/player.html?aid=260558637&bvid=BV1Ke411g7eP&cid=832614157&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>
        ''',
        "BV260558637",
        "American",
        "Boston"
    ));
    pushData(VideoDataPayload(
        "小缸和阿灿",
        "https://i1.hdslb.com/bfs/face/f1ef95121c672743b8fcff9edc013930a451268a.jpg@240w_240h_1c_1s.webp",
        "37961599",
        "https://i0.hdslb.com/bfs/archive/6ac631c5b5e01da42b9871fbf35f18a4d3cb01b3.jpg",
        '''
        <iframe src="https://player.bilibili.com/player.html?aid=260209338&bvid=BV1ce41137Kx&cid=822623383&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>
        ''',
        "BV1ce41137Kx",
        "China",
        "XinJiang"
    ));
  }

  void pushData(VideoDataPayload rhs) {
    _data.add(rhs);
    if (_data[0].likes == 0) {
      _data[0].likes = 9999;
    }
    if (_data[0].comments == 0) {
      _data[0].comments = 9999;
    }
  }

  VideoDataPayload getData() {
    return _data[Random().nextInt(_data.length)];
  }

}