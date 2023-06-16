import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passport/presentation/page/detail.dart';
import 'package:passport/presentation/widget/enter_name.dart';
import 'package:passport/utils/constants/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: Center(child: EnterNameWidget((name) {
        if(name.isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("please enter name")));
          return;
        }
        Get.to(()=>const DetailPage(), arguments: name);
      })),
    );
  }
}
