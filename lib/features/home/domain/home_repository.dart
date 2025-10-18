import 'package:cat_lover_app/core/network/models/result.dart';
import 'package:cat_lover_app/features/home/models/breed_model_response.dart';

abstract class HomeRepository {
  Future<Result<List<BreedModel>>> getBreeds();
}