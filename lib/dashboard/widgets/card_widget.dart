import 'dart:developer';

import 'package:auth/dashboard/models/product_model.dart';
import 'package:auth/dashboard/product_control/product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//    ده يا احمد شكل ال card اللي هيتعرض

class customcard extends StatelessWidget {
  customcard({required this.productModel, required this.controller});
  final ProductModel productModel;
  final ProductCubit controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 0.2,
                color: Colors.grey.withOpacity(0.1),
                offset: const Offset(1, 5)),
          ]),
          child: Card(
            elevation: 6,
            color: Colors.white,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productModel.name!,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            if (productModel.favorite == 1) {
                              controller.addItemToFavorite(
                                  productModel.id ?? 0, 0);
                            } else {
                              controller.addItemToFavorite(
                                  productModel.id ?? 0, 1);
                            }
                          },
                          child: productModel.favorite == 1
                              ? const Icon(
                                  CupertinoIcons.heart_fill,
                                  color: Color.fromARGB(255, 239, 29, 9),
                                )
                              : const Icon(
                                  CupertinoIcons.heart,
                                  color: Color.fromARGB(255, 239, 29, 9),
                                )),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(productModel.desc!,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20)),
                               InkWell(onTap: () {
                                 
                               },
                                 child: productModel.favorite == 1
                                                               ? const Icon(
                                    CupertinoIcons.cart,
                                    color: Color.fromARGB(255, 20, 160, 254),
                                  )
                                                               : const Icon(
                                    CupertinoIcons.cart,
                                    color: Color.fromARGB(255, 10, 147, 216),
                                  ),
                               )
                     
                    ],
                  ),
                ]),
          ),
        ),

        // Positioned(bottom:70 ,left: 40,
        //    child: Image.network(productModel.image! as String,width: 150,height: 80,))
      ],
    );
  }
}
