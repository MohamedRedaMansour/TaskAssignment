import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:link_assignment/data/remote/api_call.dart';
import 'package:link_assignment/data/remote/get_response.dart';
import 'package:link_assignment/pages/mainPage/model/articles_model.dart';
import 'package:link_assignment/utils/constants.dart';

class MainPageViewModel extends GetxController with GetResponse{
  ArticlesModel? articlesModel;


  @override
  void onInit() {
    getDetails();
    super.onInit();
  }

  getDetails() {
    //EasyLoading.show(status: 'Loading...');
    //AppSharedPref.getString(AppSharedPref.KEY_STAFF_ID).then((value) {
      ApiCall.makeCall(Constants.METHOD_GET, Constants.GET_ARTICLES, {}, this);
    //});
  }


  @override
  void getResponse(String response) {
    try {
      //EasyLoading.dismiss();
      Map responseMap = json.decode(response);
      articlesModel = ArticlesModel.fromJson(responseMap) ;
      if (articlesModel?.status == "ok") {

      }
    } catch (e) {
      print(e);
    }

    update();
  }
}

