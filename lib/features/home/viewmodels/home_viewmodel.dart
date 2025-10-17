import 'package:get/get.dart';
import 'package:cat_lover_app/features/home/domain/home_repository.dart';
import 'package:cat_lover_app/features/home/models/breed_model_response.dart';

class HomeViewModel extends GetxController {

  final HomeRepository _homeRepository;
  final RxList<BreedModel> breeds = RxList<BreedModel>();

  HomeViewModel(this._homeRepository);

  @override
  void onInit() {
    super.onInit();
    _homeRepository.getBreeds().then((result) {
      result.when(
        success: (data) => {
          breeds.value = data,
        },
        failure: (message) => {
          breeds.value = [],
        },
      );
    });
  }
}
