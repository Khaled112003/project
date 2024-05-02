import 'package:auth/dashboard/models/product_model.dart';
import 'package:auth/dashboard/repos/firbase_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(UserLoading());
  List product_list =[];
  Future<void> apper() async {
    emit(UserLoading());
        // product_list=await firebase_repo.instance.addProduct();
    product_list = await firebase_repo.instance.fetch();
    if (product_list.isEmpty) {
      emit(UserEmpty());
    } else {
      emit(UserLoaded());
    }
  }
  
}
