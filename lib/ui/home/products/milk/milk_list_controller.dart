import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlineShop/constants/app_image.dart';
import 'package:onlineShop/data/mock_data.dart';
import 'package:onlineShop/model/product_model.dart';

class MilkController extends GetxController{
  final searchController = TextEditingController();
  var dataProduct = <Product>[];

  bool isLoading = false;

  Future<bool> getData() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    dataProduct = milksList;
    isLoading = false;
    update();
    return isLoading;
  }

  void searchMovies(String query) {
    if (query.isNotEmpty) {
      dataProduct = _milks.where((Product movie) {
        return movie.title.contains(query);
      }).toList();
    } else {
      dataProduct = _milks;
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }


  final _milks = [
    Product(
        imageName: AppImages.milk,
        title: 'milk',
        price: '10',
        description: "cn bd v"),
    Product(
        imageName: AppImages.cream,
        title: 'cream',
        price: '10',
        description: "hbdsjkhcbf"),
    Product(
        imageName: AppImages.yougurt,
        title: 'yougurt',
        price: '10',
        description: "yougurt"),

  ];
}