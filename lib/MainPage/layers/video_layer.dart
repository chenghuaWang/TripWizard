import 'package:flutter/material.dart';
import 'package:trip_wizard/MainPage/widget/video_exploregrids.dart';

import 'package:trip_wizard/MainPage/utils/const.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.lightTheme.backgroundColor,
        leading: Container(
          padding: const EdgeInsets.only(top: 10.0),
          child: const Icon(
            Icons.subject,
            color: Colors.black38,
          ),
        ),
        title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Container(
                  height: 35,
                  width: 218,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      children:  [
                        const SizedBox(width: 3),
                        const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20,
                        ),
                        const SizedBox(width: 5,),
                        Flexible(
                          child: TextField(
                            decoration: const InputDecoration.collapsed(
                              hintText: 'TripWizard',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.teal,
                                  fontFamily: 'WorkSansBold'
                              ),
                            ),
                            onTap: (){
                              // TODO add search page
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Icon(
              Icons.add,
              color: Colors.teal,
            ),
          )
        ],
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: const [
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(width: 3),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 15,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: ExploreGrids(),
            ),
          ],
        ),
      ),
    );
  }
}