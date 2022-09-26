import 'package:flutter/material.dart';
import 'package:trip_wizard/MainPage/utils/const.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.lightTheme.backgroundColor,
        leading: Container(
          padding: const EdgeInsets.only(top: 10.0),
          child: IconButton(
            icon: const Icon(Icons.subject, color: Colors.black38,),
            onPressed: () {

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
              Icons.notifications_none,
              color: Colors.black38,
            ),
          )
        ],
        elevation: 0.0,
      ),
    );
  }
}