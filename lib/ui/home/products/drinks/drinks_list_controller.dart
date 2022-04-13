import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlineShop/constants/app_image.dart';
import 'package:onlineShop/data/mock_data.dart';
import 'package:onlineShop/model/product_model.dart';

class DrinksController extends GetxController {
  final searchController = TextEditingController();
  var dataProduct = <Product>[];

  bool isLoading = false;

  Future<bool> getData() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    dataProduct = drinkList;
    isLoading = false;
    update();
    return isLoading;
  }

  void searchMovies(String query) {
    if (query.isNotEmpty) {
      dataProduct = _drinks.where((Product movie) {
        return movie.title.contains(query);
      }).toList();
    } else {
      dataProduct = _drinks;
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  final _drinks = [
    Product(
        imageName: AppImages.cola,
        title: 'coca cola',
        price: '10',
        description: "cn bd v"),
    Product(
        imageName: AppImages.fanta,
        title: 'fanta',
        price: '10',
        description: "hbdsjkhcbf"),
    Product(
        imageName: AppImages.sprite,
        title: 'sprite',
        price: '10',
        description: "hbvgcgds"),
    Product(
        imageName: AppImages.morshynska,
        title: 'morshynska',
        price: '10',
        description: "....")
  ];


}
