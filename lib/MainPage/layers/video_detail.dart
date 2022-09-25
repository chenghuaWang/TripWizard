import 'package:flutter/material.dart';
import 'package:trip_wizard/MainPage/utils/const.dart';
import 'package:trip_wizard/MainPage/utils/video_data_crap.dart';

// The video problem occurs here
// https://github.com/flutter/flutter/issues/71822

// Widget. Video Player
import 'package:trip_wizard/MainPage/widget/video_player.dart';

class VideoDetails extends StatelessWidget {

  VideoDataPayload data;

  VideoDetails(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.lightTheme.backgroundColor,
        leading: Container(
          padding: const EdgeInsets.only(top: 10.0),
          child: IconButton(
              onPressed: () => {
                Navigator.of(context).pop()
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black38,
              ),
          )
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            alignment: Alignment.center,
            child: Text(data.location, style: const TextStyle(
                color: Colors.teal,
                fontFamily: 'WorkSansBold',
                fontSize: 16,
            ),
            )
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ],
      ),
      body: Column(
        children: [
          VideoPlayer4BiliBili(data.videoStreamUrl)
        ],
      ),
    );
  }
}
