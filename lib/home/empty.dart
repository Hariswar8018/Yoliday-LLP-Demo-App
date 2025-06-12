import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  String str;
   Empty({super.key,required this.str});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("👋",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30),)),
          Center(child: Text("Coming Soon !",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 19),)),
          Center(child: Text("$str Page will come soon"))
        ],
      ),
    );
  }
}
