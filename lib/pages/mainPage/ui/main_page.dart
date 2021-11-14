import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:link_assignment/pages/itemDetails/ui/item_details.dart';
import 'package:link_assignment/pages/mainPage/ui/drawer.dart';
import 'package:link_assignment/pages/mainPage/viewModel/main_page_view_model.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageViewModel>(
        init:Get.find<MainPageViewModel>(),
        builder:(controller)=> Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
          child: /*controller.articlesModel?.articles?.length == 0 ||
              controller.articlesModel?.articles?.length == null ? */ListView.builder(
              itemCount: controller.articlesModel?.articles?.length ?? 0,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,i){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ItemDetails(
                        article: controller.articlesModel?.articles?[i],
                      )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height *.38,
                      child: Column(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height *.22,
                              child:
                              FadeInImage(
                                image: NetworkImage(controller.articlesModel?.articles?[i].urlToImage ?? ""),
                                placeholder: const AssetImage("assets/images/placeholder.png"),
                                fit: BoxFit.fill,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                controller.articlesModel?.articles?[i].title ?? "Title",
                              style: const TextStyle(
                                  color:Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                controller.articlesModel?.articles?[i].author ?? "Author",
                                style:  TextStyle(
                                  color:Colors.grey.shade600,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                controller.articlesModel?.articles?[i].publishedAt ?? "Date",
                                style:  TextStyle(
                                  color:Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          ) /*: const Center(child:  Text("There are no data"),),*/
        ),
      ),
    ));
  }
}
