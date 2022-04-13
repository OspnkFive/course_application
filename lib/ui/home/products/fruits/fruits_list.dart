import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlineShop/model/product_model.dart';
import 'package:onlineShop/ui/home/products/bin/bin_list_controller.dart';
import 'package:onlineShop/ui/home/products/fruits/fruits_list_controller.dart';

class FruitsListWidget extends StatefulWidget {
  FruitsListWidget({Key? key}) : super(key: key);

  @override
  _FruitsListWidgetState createState() => _FruitsListWidgetState();
}

class _FruitsListWidgetState extends State<FruitsListWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BinController>(
      builder: (bC) {
        return GetBuilder<FruitsController>(
            init: FruitsController(),
            builder: (fC) {
              return Stack(
                children: [
                  fC.isLoading
                      ? const Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator())
                      : fC.dataProduct.isEmpty
                          ? const Center(
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text('data empty')),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.only(top: 70),
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              itemCount: fC.dataProduct.length,
                              itemExtent: 160,
                              itemBuilder: (BuildContext context, int index) {
                                Product movie = fC.dataProduct[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black.withOpacity(0.2)),
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              blurRadius: 8,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              child: Image(
                                                  image: AssetImage(movie.imageName)),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    movie.title,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    movie.price,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.blueGrey),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    movie.description,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 15),
                                          ],
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(10)),
                                          onTap: () => bC.addToBin(movie),
                                          // onLongPress: () => _binProduct.add(movie),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: fC.searchController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withAlpha(235),
                          border: OutlineInputBorder()),
                      onChanged: (v) {
                        setState(() {
                          v = fC.searchController.text;
                          fC.searchMovies(v);
                        });
                      },
                    ),
                  ),
                ],
              );
            });
      }
    );
  }
}
