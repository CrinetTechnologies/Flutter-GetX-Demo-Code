import 'package:get/get.dart';

import '../presentation/controllers/details_controller.dart';

// class DetailsBinding extends Binding {
//   @override
//   List<Bind> dependencies() {
//     return [
//       Bind.lazyPut(() => DetailsController(homeRepository: Get.find())),
//     ];
//   }
// }
class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController(homeRepository: Get.find()));
  }
}