import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_app/controllers/question_paper/data_uploader.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  DataUploader controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("uploading"),
      ),
    );
  }
}
