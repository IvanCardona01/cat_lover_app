import 'package:get/get.dart';
import 'package:cat_lover_app/core/network/domain/network_repository.dart';
import 'package:cat_lover_app/core/network/data/dio_network_repository_impl.dart';

Future<void> initializeCoreDependencies() async {
  Get.lazyPut<NetworkRepository>(() => NetworkRepositoryImpl());
}
