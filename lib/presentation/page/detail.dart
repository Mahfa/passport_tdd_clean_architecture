import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passport/domain/model/data_state.dart';
import 'package:passport/domain/repository/api_repository.dart';
import 'package:passport/locator.dart';
import 'package:passport/presentation/controller/detail_controller.dart';
import 'package:passport/presentation/widget/load_failed.dart';
import 'package:passport/presentation/widget/passport_card.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    final dc = Get.put(DetailController(locator<ApiRepository>()));
    dc.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Passport info")),
      body: GetX<DetailController>(builder: (controller) {
        if (controller.data.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.data.value is DataFailed || controller.data.value is DataNotSet) {
          return Center(child: LoadFailed(() => controller.getData()));
        }
        if (controller.data.value is DataSuccess) {
          return Center(child: PassportCard(controller.data.value!.data!));
        }
        return const Offstage();
      }),
    );
  }
}
