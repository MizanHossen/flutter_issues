import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_issues/helpers/util/api_url.dart';
import 'package:flutter_issues/models/data_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var issuesData = <DataModel>[].obs;
  var limit = 1.obs;
  var isLimit = false.obs;
  var lastPageNum = 0.obs;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!isLimit.value && !isLoading.value) {
          getData();
        }
      }
    });
  }

  void getData() async {
    if (isLimit.value || isLoading.value) return;

    isLoading.value = true;

    try {
      var dio = Dio(
        BaseOptions(
          baseUrl: ApiUrl.baseUrl,
        ),
      );

      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult == ConnectivityResult.none) {
        Get.snackbar("No Internet", "Please check your internet connection");
        return;
      }

      var response = await dio.get(
        "/repos/flutter/flutter/issues",
        queryParameters: {
          "per_page": "3",
          "page": limit.value,
        },
      );

      if (response.statusCode == 200) {
        var allData = response.data;
        List<DataModel> dataModels = dataModelFromJson(json.encode(allData));
        issuesData.addAll(dataModels);

        if (limit.value == lastPageNum.value) {
          isLimit.value = true;
        }

        limit.value++;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      Get.snackbar("Error", "An error occurred while fetching data");
    } finally {
      isLoading.value = false;
    }
  }

  String convertDate(String inputDate) {
    // Parse the input date string to a DateTime object
    DateTime dateTime = DateTime.parse(inputDate);

    // Format the DateTime object as a string in the desired format (day/month/year)
    String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";

    return formattedDate;
  }
}
