import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreGrids extends StatefulWidget {
  @override
  _ExploreGridsState createState() => _ExploreGridsState();
}

class _ExploreGridsState extends State<ExploreGrids> {
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
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage('assets/images/login_head.jpg'),
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
                        Icon(
                          Icons.location_on,
                          size: 15,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'HangZhou',
                          style: TextStyle(
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
                    children: [
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
          );
        },
      ),
    );
  }
}
