import 'package:get/get.dart';
import 'package:onlineShop/model/product_model.dart';

class BinController extends GetxController {
  List<Product> binProduct = <Product>[];
  bool isLoading = false;

  void addToBin(Product? item) async {
    // isLoading = true;
    // await Future.delayed(const Duration(seconds: 1));
    binProduct.add(item!);
    // isLoading = false;
    update();
  }

  void deleteItem(String name) {
    binProduct.removeWhere((item) => item.title == name);
    update();
  }
}
