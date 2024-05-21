import 'package:auth/dashboard/models/product_model.dart';
// import 'package:auth/dashboard/repos/firbase_repo.dart';
import 'package:auth/dashboard/repos/localdb.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  static ProductCubit instance = ProductCubit();
 

  ProductCubit() : super(ProductStateLoading()) {
    fetchProducts();
  }
 
 List<ProductModel> product = [];

  DatabaseRepo repo = DatabaseRepo();
  Future<void> fetchProducts() async {
    emit(ProductStateLoading());
    await repo.initDB();
    // repo.insertProduct("55555", 'yiguy', 2, 4, Uint8List(10));

    product= await repo.fetchProducts();
    if (product.isEmpty) {
      emit(ProductStateEmpty());
    } else {
      emit(ProductStateLoaded());
    }
  }

  void addItemToFavorite(int id, int value) {
    repo.updateFavorite(value, id);
    fetchProducts ();
    emit(ProductStateLoaded());
  }
  void addItemToCart(int id) {
    repo.updateCart(1, id);
    emit(ProductStateLoaded());
  }
}
