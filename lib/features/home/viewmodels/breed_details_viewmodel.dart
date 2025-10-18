import 'package:cat_lover_app/features/home/models/breed_model_response.dart';
import 'package:cat_lover_app/shared/bases/base_viewmodel.dart';

class BreedDetailsViewModel extends BaseViewModel {
  final BreedModel? breed;

  BreedDetailsViewModel(this.breed);  
}
