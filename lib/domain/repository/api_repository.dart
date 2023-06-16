import 'package:passport/domain/model/passport_info.dart';
import 'package:passport/domain/model/data_state.dart';

abstract class ApiRepository {
  Future<DataState<PassportInfo>> getPassportInfo();
}
