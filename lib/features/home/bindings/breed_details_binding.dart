import 'package:get/get.dart';
import 'package:cat_lover_app/features/home/viewmodels/breed_details_viewmodel.dart';
import 'package:cat_lover_app/features/home/models/breed_model_response.dart';

class BreedDetailsBinding extends Bindings {
  @override
  void dependencies() {
    final BreedModel? breed = Get.arguments['breed'];
    Get.lazyPut<BreedDetailsViewModel>(() => BreedDetailsViewModel(breed));
  }
}