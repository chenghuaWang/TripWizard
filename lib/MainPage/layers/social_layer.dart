import 'package:flutter/material.dart';
import 'package:trip_wizard/MainPage/utils/const.dart';

// import details page. Build method.
import 'package:trip_wizard/MainPage/layers/social_hot_details.dart';
import 'package:trip_wizard/MainPage/layers/social_recommend_details.dart';
import 'package:trip_wizard/MainPage/layers/social_star_details.dart';
import 'package:trip_wizard/MainPage/layers/social_publish_layer.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({super.key});

  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.lightTheme.backgroundColor,
            leading: Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: IconButton(
                icon: const Icon(Icons.subject, color: Colors.black38,),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Container(
                    height: 35,
                    width: 188,
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
              ),
            ),
            actions: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PopupMenuButton<String>(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      color: Constants.lightTheme.backgroundColor,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.teal,
                      ),
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        PopupMenuItem(
                          value: 'Push',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: ()=>{
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>const SocialPublishPage())
                                  )
                                },
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.question_mark,
                                      color: Colors.teal,
                                      size: 16,
                                    ),
                                    Text(
                                      '??????',
                                      style: TextStyle(
                                          fontSize: 14
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]
                  )
              )
            ],
            elevation: 0.0,
            bottom: const TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.teal,
              tabs: [
                Tab(text: "??????"),
                Tab(text: "??????"),
                Tab(text: "??????"),
              ],
            ),
          ),
          body: TabBarView(
              children: [
                _buildStarDetails(context),
                _buildRecommendDetails(context),
                _buildHotDetails(context),
              ]
          ),
        ),
    );
  }

  Widget _buildHotDetails(BuildContext context) {
    return SocialHotDetails();
  }

  Widget _buildRecommendDetails(BuildContext context) {
    return SocialRecommendDetails();
  }

  Widget _buildStarDetails(BuildContext context) {
    return SocialStarDetails();
  }
}