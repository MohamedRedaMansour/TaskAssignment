import 'package:flutter/material.dart';
import 'package:link_assignment/pages/liveChat/ui/live_chat.dart';
import 'package:link_assignment/pages/mainPage/ui/drawer.dart';
import 'package:link_assignment/pages/mainPage/ui/main_page.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({Key? key}) : super(key: key);

  // Widget getPage(){
  //   print(index);
  //   switch(index){
  //     case 0 :
  //       return MainPage();
  //       break;
  //     case 1 :
  //       return LiveChat();
  //       break;
  //     default:
  //       return MainPage();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'ARTICLES',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                )
            ),
          ]
      ),
      body: index == 0 ? MainPage() : LiveChat(),
    );
  }
}
