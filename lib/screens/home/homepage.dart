import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:CarpApp/screens/home/post.dart'; //this link is wrong? 

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> postList = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assests/post.json');
    final data = await json.decode(response);

    setState(() {
      postList = data['post'].map((data) => Post.fromJson(data)).toList();
    });
  }
  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CarpTo', style: TextStyle(fontSize: 20)),
        actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        
        width: double.maxFinite,
        child: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: 5,
            separatorBuilder: ((context, index) {
              return const Divider(
                indent: 10,
                endIndent: 10,
              );
            }),
            itemBuilder: (context, index) {
              //return Placeholder(fallbackHeight: 150,);
              return postComponent();
              //need to retrieve data from post but not sure how
              //   return FadeAnimation(
              //        (1.0 + index) / 4, postComponent(post: postList[index]));
            }),
      ),
      backgroundColor: Colors.green.shade50,
    );
  }

  postComponent() {
    return Container(
      padding: const EdgeInsets.all(7),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ]),
        
      child: Column(
        children: <Widget>[
          //Icon, Name, Username
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.person,
                  size: 40,
                ),
                Text(
                  'FirstName Last',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '@username',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w200),
                ),
              ]),

          SizedBox(
            height: 5,
          ),

          //Destination and Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.location_pin,
                size: 20,
                color: Colors.grey.shade700,
              ),
              Text(
                'Destination: School',
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15,
                    fontWeight: FontWeight.w200),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.access_time,
                size: 20,
                color: Colors.grey.shade700,
              ),
              Text(
                'Time',
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15,
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),

          //TAGS
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.deepPurple.withOpacity(.3)),
                  child: Text(
                    'Passenger',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue.withOpacity(.4),
                  ),
                  child:
                      Text('other tag', style: TextStyle(color: Colors.black)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.deepOrange.withOpacity(.3),
                  ),
                  child: Text(
                    'Capacity',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ]),
          SizedBox(
            height: 15,
          ),

          //Description box
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade300,
                ),
                //problem with description, text overflows and does
                //not go onto the next line ... need to fix later
                child: Text(
                  'Can someone give me a ride to school?',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
