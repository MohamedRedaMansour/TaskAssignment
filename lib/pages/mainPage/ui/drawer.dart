import 'package:flutter/material.dart';
import 'package:link_assignment/pages/liveChat/ui/live_chat.dart';

int index = 0;
class CustomDrawer extends StatefulWidget {

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
           Padding(
             padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
             child: DrawerHeader(
                child: Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height *.1,
                      child: Image.asset('assets/images/profile.png')
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Welcome",style: TextStyle(fontSize: 14,color: Colors.grey)),
                        Text("Tony Roshdy",style: TextStyle(fontSize: 18,color: Colors.black87),)
                      ],
                    )
                  ],
                )),
           ),
          GestureDetector(
            onTap: (){
                index = 0;
               Navigator.of(context).pop();
            },
            child: CreateDrawerBodyItem(
                image: 'assets/images/explore.png',text: 'Articles'),
          ),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: (){

            },
            child: CreateDrawerBodyItem(
                image: 'assets/images/live.png',text: 'Live chat'),
          ),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: (){

            },
            child: CreateDrawerBodyItem(
                image: 'assets/images/gallery.png',text: 'Gallery'),
          ),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: (){

            },
            child: CreateDrawerBodyItem(
                image: 'assets/images/wishlist.png',text: 'Wish List'),
          ),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: (){

            },
            child: CreateDrawerBodyItem(
                image: 'assets/images/explore.png',text: 'Explore online feeds'),
          ),
        ],
      ),
    );
  }
}

class CreateDrawerBodyItem extends StatelessWidget {

  final String text ;
  final String image;
  CreateDrawerBodyItem({required this.text,required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width *.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width *.07,
                child: Image.asset(image)
            ),
          const SizedBox(width: 15,),
          Text(text,style: const TextStyle(color: Colors.black,fontSize: 17),)
          ],
        ),
      ),
    );
  }
}

