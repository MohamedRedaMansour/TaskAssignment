import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:link_assignment/pages/mainPage/viewModel/main_page_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainPageViewModel());
    // Get.lazyPut(() => SignUpViewModel());
  }
}