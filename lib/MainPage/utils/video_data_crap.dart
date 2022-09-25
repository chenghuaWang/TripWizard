import 'dart:math';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

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

 // automatic cached data
 late var upAvatar;
 late var videoHeadPic;

 VideoDataPayload(
     this.upName,
     this.upAvatar,
     this.upNumber,
     this.videoHeadPicUrl,
     this.videoStreamUrl,
     this.videoId,
     this.location,
     this.city
 );
}

class VideoDataMaintainer {
  late List<VideoDataPayload> _data;

  Future<void> pushData(VideoDataPayload rhs) async {
    _data.insert(0, rhs);
    _data[0].upAvatar = await DefaultCacheManager().getSingleFile(_data[0].upAvatarUrl);
    _data[0].videoHeadPic = await DefaultCacheManager().getSingleFile(_data[0].videoHeadPicUrl);
    if (_data[0].likes == 0) {
      // TODO get likes using http.
    }
    if (_data[0].comments == 0) {
      // TODO get comments using http.
    }
  }

  List<VideoDataPayload> getData(int nums) {
    // TODO sampling nums data from database.
    return _data;
  }
}

List data = List.generate(10, (index)=>{
  // "name": names[random.nextInt(5)],
  // "city": city[random.nextInt(5)],
  // "location": location[random.nextInt(5)],
  // "places": places[random.nextInt(5)],
  // "dp": "assets/images/friends/dp${random.nextInt(4)}.jpg",
  // "posts": "assets/images/posts/post${random.nextInt(3)}.jpg",
  // "saved": "assets/images/saved/saved${random.nextInt(4)}.jpg",
  // "story": "assets/images/story/cm${random.nextInt(10)}.jpeg",
});