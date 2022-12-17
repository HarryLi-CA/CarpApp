import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //search bar
       appBar: AppBar(
        title: SizedBox(
          height: 45,
          child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //padding: const EdgeInsets.all(10),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
          ),
          Text('Recommended Friends', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,fontSize: 20, ), ),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: 5,
                separatorBuilder: ((context, index) {
                  return const Divider(
                    indent: 10,
                    endIndent: 10,
                  );
                }
                ),
                itemBuilder: (context, index) {
                  return friendlist();
                }),
          ),
          Text('Recommended Groups', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,fontSize: 20, ),),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: 5,
                separatorBuilder: ((context, index) {
                  return const Divider(
                    indent: 10,
                    endIndent: 10,
                  );
                }
                ),
                itemBuilder: (context, index) {
                  return groupList();
                }),)


        ],
        //padding: const EdgeInsets.all(20),
        //width: double.maxFinite,

        /** 
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Reccomended Friends', style: TextStyle(color: Colors.black),),
            Row(
              children: <Widget>[
                ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: 15,
                    separatorBuilder: ((context, index) {
                      return const Divider(
                        indent: 10,
                        endIndent: 10,
                      );
                    }),
                    itemBuilder: (context, index) {
                      return friendlist();
                    }),
              ],
            ),
          ],
        ),
        */
        //child: Text('Reccomended Friends', style: TextStyle(color: Colors.black) ),
        /** 
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
              return friendlist();
            }),

            */
      ),
    );
  }

  friendlist() {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Icon(
              Icons.person,
              size: 50,
            ),
            //  Text('Firstname Last', style: TextStyle(color: Colors.black)),
          ]),
          Column(
            children: <Widget>[
              Text('Firstname Last', style: TextStyle(color: Colors.black)),
            ],
          ),
          // SizedBox(width: 60,),
          Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Align(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.person_add,
                    color: Colors.green.shade200,
                    size: 25,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                  ),
                ),
                alignment: Alignment.topRight,
              ),
            ],
          )
        ],
      ),
    );
  }

  groupList(){
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Icon(
              Icons.school,
              size: 50,
            ),
            
          ]),
          Column(
            children: <Widget>[
              Text('Woodlands SS', style: TextStyle(color: Colors.black)),
            ],
          ),
          
          Column(
            children: <Widget>[
              Align(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.green.shade200,
                    size: 25,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                  ),
                ),
                alignment: Alignment.topRight,
              ),
            ],
          )
        ],
      ),
    );

  }


}
