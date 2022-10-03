import 'package:flutter/material.dart';
import 'package:trip_wizard/MainPage/layers/video_detail.dart';
import 'package:trip_wizard/MainPage/utils/video_data_crap.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreGrids extends StatefulWidget {
  const ExploreGrids({super.key});

  @override
  _ExploreGridsState createState() => _ExploreGridsState();
}

class _ExploreGridsState extends State<ExploreGrids> {
  VideoDataMaintainer videoDispatcher = VideoDataMaintainer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index){

          var tmpData = videoDispatcher.getData();

          return GestureDetector(
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> VideoDetails(tmpData))
              )
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(tmpData.videoHeadPicUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 15,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            tmpData.location,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Ubuntu-Regular'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Spacer(),
                  SizedBox(height: 64,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.thumb_up,
                          size: 15,
                          color: Colors.white,
                        ),
                        Spacer(),
                        Icon(
                          Icons.share,
                          size: 15,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
