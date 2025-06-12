import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoliday_llp/global.dart';
import 'package:yoliday_llp/home/empty.dart';
import 'package:yoliday_llp/home/navigation.dart';
import 'package:yoliday_llp/home/portfolio.dart';


class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  Widget diu(){
    if(_currentIndex==2){
      return Empty(str: "Input");
    }else if(_currentIndex==1){
      return Portfolio();
    }else if(_currentIndex==3){
      return Empty(str: "Profile");
    }
    return Empty(str: "Home");
  }
  Future<bool> _onWillPop(BuildContext context) async {
    bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Exit App"),
          content: Text("Are you sure you want to exit?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false), // Stay in the app
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true), // Exit the app
              child: Text("Exit"),
            ),
          ],
        );
      },
    ) ?? false; // If the dialog is dismissed, return false (stay in the app)
    return exitApp;
  }
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: sd(false));
  }

  Widget sd(bool b){
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Portfolio",style: TextStyle(fontWeight: FontWeight.w600),),
        actions: [
          SvgPicture.asset(
            "assets/ic_round-shopping-bag.svg",
          ),
          SizedBox(width: 15,),
          SvgPicture.asset(
            "assets/Vector.svg",
          ),
          SizedBox(width: 19,),
        ],
      ),
      backgroundColor: Colors.white,
      body: diu(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex=index;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: "Portfolio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: "Input",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        selectedItemColor: Global.basic, // Selected icon color
        unselectedItemColor: Colors.grey, // Unselected icon color
        backgroundColor: Colors.white,
        showSelectedLabels: true,showUnselectedLabels: true,
      ),
    );
  }
  int _currentIndex = 1;
}
