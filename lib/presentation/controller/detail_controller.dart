import 'package:get/get.dart';
import 'package:passport/domain/model/data_state.dart';
import 'package:passport/domain/repository/api_repository.dart';

import '../../domain/model/passport_info.dart';

class DetailController extends GetxController {
  ApiRepository repository;
  final data = Rx<DataState<PassportInfo>?>(null);

  DetailController(this.repository);

  void getData() async {
    data.value = null;
    data.value = await repository.getPassportInfo();
  }
}
