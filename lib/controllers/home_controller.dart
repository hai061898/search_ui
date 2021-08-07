import 'package:get/get.dart';
import 'package:searchbox/data/data_user.dart';
import 'package:searchbox/models/data_models.dart';

class HomeController extends GetxController {
  RxList findsearch = [].obs;
  final isFollow = false.obs;

  late User user;

  onInit() {
    super.onInit();
    findsearch.value = users;
  }

  isFollower() {
    isFollow.value = !isFollow.value;
  }

  isTest(bool v) {
    if (isFollow.value) {
      return v = !isFollow.value;
    } else {
      return v = !isFollow.value;
    }
  }

  onseach(String s) {
    findsearch.value =
        users.where((e) => e.name.toLowerCase().contains(s)).toList();
  }
}
