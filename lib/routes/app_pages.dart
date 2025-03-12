import 'package:get/get.dart';
import 'package:getx_structure/pages/home/bindings/details_binding.dart';
import '../pages/home/bindings/home_binding.dart';
import '../pages/home/presentation/views/details_view.dart';
import '../pages/home/presentation/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
            name: Routes.DETAILS,
            page: () => const DetailsView(),
            binding: DetailsBinding()),
      ],
    ),
  ];
}
