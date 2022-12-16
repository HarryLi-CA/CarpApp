import 'package:carpto/screens/home/homepage.dart';
import 'package:carpto/screens/post/postpage.dart';
import 'package:carpto/screens/profile/profilepage.dart';
import 'package:carpto/screens/search/searchpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: new Scaffold(
          body: TabBarView(
            children: [
              new HomePage(),
              new SearchPage(),
              new PostPage(),
              new ProfilePage(),
            ],
          ),
          bottomNavigationBar: new Material(
            color: Colors.green,
            child: TabBar(tabs: [
                Tab(
                  icon: new Icon(Icons.home),
                ),
                Tab(
                  icon: new Icon(Icons.person_search),
                ),
                Tab(
                  icon: new Icon(Icons.add_to_photos_rounded),
                ),
                Tab(
                  icon: new Icon(Icons.account_circle_rounded),
                ),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.green,
            ),
        ),
        backgroundColor: Colors.green.shade50,
        ),
      );
  }
}
              //person search add photos rounded account circle