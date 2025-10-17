import 'package:get/get.dart';
import 'package:cat_lover_app/features/home/domain/home_repository.dart';
import 'package:cat_lover_app/features/home/models/breed_model_response.dart';
import 'package:cat_lover_app/shared/bases/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  final HomeRepository _homeRepository;
  final RxList<BreedModel> breeds = RxList<BreedModel>();

  HomeViewModel(this._homeRepository);

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    _homeRepository.getBreeds().then((result) {
      isLoading.value = false;
      result.when(
        success: (data) => {breeds.value = data},
        failure: (message) => {
          breeds.value = [],
          showErrorSnackbar('Error', message),
        },
      );
    });
  }
}
