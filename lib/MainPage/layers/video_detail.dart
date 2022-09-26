import 'package:flutter/material.dart';
import 'package:trip_wizard/MainPage/utils/const.dart';
import 'package:trip_wizard/MainPage/utils/video_data_crap.dart';

// The video problem occurs here
// https://github.com/flutter/flutter/issues/71822

// Widget. Video Player
import 'package:trip_wizard/MainPage/widget/video_player.dart';

import 'package:trip_wizard/LoginPage/widget/snakbar.dart';

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
              child: PopupMenuButton<String>(
                  color: Constants.lightTheme.backgroundColor,
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.teal,
                  ),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      value: 'Judge',
                      onTap: () {

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.thumb_down,
                            color: Colors.teal,
                            size: 16,
                          ),
                          Text(
                            '举报',
                            style: TextStyle(
                                fontSize: 14
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              )
          )
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
