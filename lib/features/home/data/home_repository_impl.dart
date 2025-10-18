import 'package:cat_lover_app/features/home/domain/home_repository.dart';
import 'package:cat_lover_app/core/network/domain/network_repository.dart';
import 'package:cat_lover_app/core/network/models/result.dart';
import 'package:cat_lover_app/core/network/endpoints.dart';
import 'package:cat_lover_app/features/home/models/breed_model_response.dart';

class HomeRepositoryImpl implements HomeRepository {
  final NetworkRepository _networkRepository;

  HomeRepositoryImpl(this._networkRepository);

  @override
  Future<Result<List<BreedModel>>> getBreeds() async {
    final response = await _networkRepository.get(Endpoints.getBreeds);

    return response.when(
      success: (data) => Result.success(BreedModelResponse.fromJson(data.data).breeds),
      failure: (message) => Result.failure(message),
    );
  }
}