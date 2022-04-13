import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlineShop/ui/home/products/bin/bin_list_controller.dart';
import 'package:onlineShop/ui/home/products/vegetable/vegetable_list_controller.dart';

class VegetablesListWidget extends StatefulWidget {
  const VegetablesListWidget({Key? key}) : super(key: key);

  @override
  _VegetablesListWidgetState createState() => _VegetablesListWidgetState();
}

class _VegetablesListWidgetState extends State<VegetablesListWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BinController>(builder: (bC) {
      return GetBuilder<VegetableController>(
          init: VegetableController(),
          builder: (vC) {
            return Stack(
              children: [
                vC.isLoading
                    ? const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator())
                    : vC.dataProduct.isEmpty
                        ? const Center(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('data empty')),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(top: 70),
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            itemCount: vC.dataProduct.length,
                            itemExtent: 160,
                            itemBuilder: (BuildContext context, int index) {
                              final item = vC.dataProduct[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.2)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 8,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: Row(
                                        children: [
                                          Container(
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                child: Image(
                                                    image: AssetImage(
                                                        item.imageName)),
                                              )),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  item.title,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  item.price,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.blueGrey),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  item.description,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                        ],
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        onTap: () => bC.addToBin(item),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: vC.searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withAlpha(235),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (v) {
                        setState(() {
                          v = vC.searchController.text;
                          vC.searchMovies(v);
                        });
                      },
                    ),
                  ),
                ),
              ],
            );
          });
    });
  }
}
