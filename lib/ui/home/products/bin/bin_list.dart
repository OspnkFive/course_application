import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlineShop/ui/home/products/bin/bin_list_controller.dart';

class BinScreen extends StatefulWidget {
  const BinScreen({Key? key}) : super(key: key);

  @override
  _BinScreenState createState() => _BinScreenState();
}

class _BinScreenState extends State<BinScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BinController>(
        init: BinController(),
        builder: (bC) {
          return Scaffold(
            appBar: AppBar(title: Text('Bin')),
            body: bC.isLoading
                ? const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator())
                : bC.binProduct.isEmpty
                    ? const Center(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text('Bin empty')),
                      )
                    : ListView.builder(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: bC.binProduct.length,
                        itemExtent: 160,
                        itemBuilder: (BuildContext context, int index) {
                          final item = bC.binProduct[index];
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
                                          height: 70,
                                          width: 70,
                                          child: Image(
                                              image:
                                                  AssetImage(item.imageName))),
                                      const SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  item.title,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                GestureDetector(
                                                    onTap: () => bC
                                                        .deleteItem(item.title),
                                                    child: Icon(Icons
                                                        .restore_from_trash)),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              item.price,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.blueGrey),
                                            ),
                                            SizedBox(height: 20),
                                            Text(
                                              item.description,
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

                              ],
                            ),
                          );
                        },
                      ),
              
          );
        });
  }
}
