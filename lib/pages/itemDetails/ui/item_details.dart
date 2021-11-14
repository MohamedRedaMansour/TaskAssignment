import 'package:flutter/material.dart';
import 'package:link_assignment/pages/mainPage/model/articles_model.dart';

class ItemDetails extends StatefulWidget {

  Article? article ;
  ItemDetails({Key? key, this.article}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  var arr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.article?.title);
    arr = widget.article?.description?.split('.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'ARTICLES Details',
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height *.3,
                          child:
                          FadeInImage(
                            image: NetworkImage(widget.article?.urlToImage ?? ""),
                            placeholder: const AssetImage("assets/images/placeholder.png"),
                            fit: BoxFit.fill,
                          )),
                      Positioned(
                        right: 1,
                        bottom: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                          child: Text(
                            widget.article?.publishedAt?.substring(0,10) ?? "Date",
                            style: const TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 15,top: 15,bottom: 5),
                    child: Text(
                      widget.article?.title ?? "title",
                      style: const TextStyle(
                        color:Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 25,top: 0,bottom: 5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.article?.author ?? "title",
                        style:  TextStyle(
                          color:Colors.grey.shade600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 25,top: 0,bottom: 5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${arr[0] ?? ""}\n\n ${arr[1] ?? ""}",
                        style:  TextStyle(
                          color:Colors.grey.shade600,
                          fontSize: 16,
                        ),

                      ),
                    ),
                  ),
                  const SizedBox(
                    height:20,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height *.07,
              child: FlatButton(
                // style: const ButtonStyle(
                // ),
                onPressed: () {},
                child: const Text(
                  'OPEN WEBSITE',
                  style: TextStyle(color: Colors.white,fontSize: 18),
                ),
              ),
            ),
          ),
          const SizedBox(
            height:20,
          )
        ],
      )
    );
  }
}
