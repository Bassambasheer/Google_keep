import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  bool? veiwtype;
  @override
  // ignore: must_call_super
  void onInit() {
    veiwtype = true;
  }

  viewtrue() {
    veiwtype = true;
    update();
  }

  viewfalse() {
    veiwtype = false;
    update();
  }

  valueassign(String value) {
    searchtext.value = value;
    update();
  }
}

RxString searchtext = ''.obs;
