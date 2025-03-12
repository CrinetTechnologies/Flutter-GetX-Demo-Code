import 'package:get/get.dart';

import '../../domain/adapters/repository_adapter.dart';
import '../../domain/entity/country_model.dart';

class DetailsController extends GetxController with StateMixin<Country> {
  DetailsController({required this.homeRepository});

  final IHomeRepository homeRepository;
   CountriesItem? country;

  @override
  void onInit() {
    super.onInit();
    country = Get.arguments;
    final countryName = country?.country;
    if (countryName == null) {
      change(null, status: RxStatus.error('Country not found'));
    } else {
      change(null, status: RxStatus.loading()); // Set Loading state
      homeRepository.getCountry(countryName).then((data) {
        change(data, status: RxStatus.success()); // Success state
      }).catchError((error) {
        change(null, status: RxStatus.error(error.toString())); // Error state
      });
    }
  }
}
