import 'package:dio/dio.dart';
import 'package:passport/domain/model/passport_info.dart';
import 'package:passport/domain/repository/api_repository.dart';
import 'package:passport/utils/constants/strings.dart';
import 'package:passport/domain/model/data_state.dart';

class ApiRepositoryImpl extends ApiRepository {
  final Dio dio;

  ApiRepositoryImpl(this.dio);

  @override
  Future<DataState<PassportInfo>> getPassportInfo() async {
    try {
      var data = (await dio.get(getPassportInfoUrl).timeout(const Duration(seconds: 15))).data;
      return DataSuccess(PassportInfo.fromJson(data));
    } on DioException catch (e) {
      return DataFailed<PassportInfo>(e);
    } catch (e) {
      return const DataNotSet<PassportInfo>();
    }
  }
}
