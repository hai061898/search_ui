import 'package:get/get.dart';
import 'package:searchbox/data/data_user.dart';
import 'package:searchbox/models/data_models.dart';

class HomeController extends GetxController {
  RxList findsearch = [].obs;
  late final User user;
  final isFollow = false.obs;
  onInit() {
    super.onInit();
    findsearch.value = users;
    
  }

  isFollower() {
    isFollow.value = !user.isFollowedByMe;
  }

  onseach(String s) {
    findsearch.value =
        users.where((e) => e.name.toLowerCase().contains(s)).toList();
  }
}
