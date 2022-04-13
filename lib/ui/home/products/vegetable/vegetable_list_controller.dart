import 'package:flutter/material.dart';
import 'package:onlineShop/constants/app_image.dart';
import 'package:onlineShop/data/mock_data.dart';
import 'package:onlineShop/model/product_model.dart';
import 'package:get/get.dart';

class VegetableController extends GetxController {
  final searchController = TextEditingController();
  var dataProduct = <Product>[];

  bool isLoading = false;

  Future<bool> getData() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    dataProduct = vegetableList;
    isLoading = false;
  update();
    return isLoading;
  }

  void searchMovies(String query) {
    if (query.isNotEmpty) {
      dataProduct = _vegetab.where((Product movie) {
        return movie.title.contains(query);
      }).toList();
    } else {
       dataProduct = _vegetab;
    }
  update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }


  final _vegetab = [
    Product(
        imageName: AppImages.cucumber,
        title: 'cucumber',
        price: '10',
        description: ""),
    Product(
        imageName: AppImages.tomato,
        title: 'tomato',
        price: '10',
        description: ""),
    Product(
        imageName: AppImages.potato,
        title: 'potato',
        price: '10',
        description: ""),
    Product(
        imageName: AppImages.cabbage,
        title: 'cabbage',
        price: '10',
        description: "")
  ];

}
