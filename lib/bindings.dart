

import 'package:get/get.dart';

import 'auth/authCtr.dart';
import 'homeCtr.dart';


AuthController authCtr = AuthController.instance;

HomeController get homeCtr => Get.find<HomeController>();





///PatientsListCtr get patListCtr => Get.find<PatientsListCtr>(); //default


class GetxBinding implements Bindings {
  @override
  void dependencies() {
    //TODO

    Get.put<AuthController>(AuthController());
    Get.put<HomeController>(HomeController());


    //Get.lazyPut<HomeController>(() => HomeController(),fenix: true);



  }
}