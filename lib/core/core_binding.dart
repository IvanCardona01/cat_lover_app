import 'package:get/get.dart';

import 'package:cat_lover_app/core/network/domain/network_repository.dart';
import 'package:cat_lover_app/core/network/data/dio_network_repository_impl.dart';

import 'package:get_storage/get_storage.dart';
import 'package:cat_lover_app/core/local_storage/domain/local_storage_service.dart';
import 'package:cat_lover_app/core/local_storage/data/get_local_storage_service_impl.dart';

Future<void> initializeCoreDependencies() async {
  Get.lazyPut<NetworkRepository>(() => NetworkRepositoryImpl());

  await GetStorage.init();
  Get.lazyPut<LocalStorageService>(() => GetLocalStorageServiceImpl());
}
