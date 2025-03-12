import 'package:get/get.dart';
import '../../domain/adapters/repository_adapter.dart';
import '../../domain/entity/country_model.dart';

class HomeController extends GetxController with StateMixin<List<CountriesItem>> {
  HomeController({required this.homeRepository});

  final IHomeRepository homeRepository;

  @override
  void onInit() {
    super.onInit();
    fetchCountries();
  }

  void fetchCountries() {
    change(null, status: RxStatus.loading()); // Set loading state

    homeRepository.getCountries().then((data) {
      change(data, status: RxStatus.success()); // Success state
    }).catchError((error) {
      change(null, status: RxStatus.error(error.toString())); // Error state
    });
  }

  Future<Country> getCountryByName(String name) async {
    return await homeRepository.getCountry(name);
  }
}
