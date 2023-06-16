import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:passport/data/repository/api_repository_impl.dart';
import 'package:passport/domain/repository/api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(dio),
  );
}
