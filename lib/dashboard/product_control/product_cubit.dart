import 'package:auth/dashboard/models/product_model.dart';
import 'package:auth/dashboard/repos/firbase_repo.dart';
import 'package:auth/dashboard/repos/localdb.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(UserLoading()){
    apper();
  }
  List<ProductModel> productList = [];
   DatabaseRepo repo = DatabaseRepo();

  Future<void> apper() async {
    emit(UserLoading());

    try {
      await repo.initDB();
  // productList = await firebase_repo.instance.fetch();
  repo.insertProduct('name', 'desc', 1, 5,Uint8List(10));
   productList = await repo.fetchProducts();
   
   
  if (productList.isEmpty) {
    emit(UserEmpty());
  } else {
    emit(UserLoaded(productList));
  }
}   catch (e) {
  emit(UserError(e.toString()));
}
  }
}