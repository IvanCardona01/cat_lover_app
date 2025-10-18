import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/home/domain/home_repository.dart';
import 'package:cat_lover_app/features/home/models/breed_model_response.dart';
import 'package:cat_lover_app/shared/bases/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  final HomeRepository _homeRepository;
  final RxList<BreedModel> breeds = RxList<BreedModel>();
  final RxList<BreedModel> allBreeds = RxList<BreedModel>();
  final RxString searchQuery = ''.obs;
  late final TextEditingController searchController;

  HomeViewModel(this._homeRepository);

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    isLoading.value = true;
    _homeRepository.getBreeds().then((result) {
      isLoading.value = false;
      result.when(
        success: (data) => {
          allBreeds.value = data,
          breeds.value = data,
        },
        failure: (message) => {
          breeds.value = [],
          allBreeds.value = [],
          showErrorSnackbar('Error', message),
        },
      );
    });
  }

  void searchBreeds(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      breeds.value = allBreeds;
    } else {
      breeds.value = allBreeds
          .where((breed) =>
              breed.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
    breeds.value = allBreeds;
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
