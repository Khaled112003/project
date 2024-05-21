import 'package:auth/dashboard/product_control/product_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../repos/localdb.dart';

part 'newproduct_state.dart';

class NewproductCubit extends Cubit<NewproductState> {
  NewproductCubit() : super(NewproductInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController qntController = TextEditingController();
  XFile? image;
  Future<void> pickProductImage() async {
    final ImagePicker picker = ImagePicker();

    image = await picker.pickImage(source: ImageSource.gallery);

    emit(NewproductInitial());
  }

  Future<void> takeProductImage() async {
    final ImagePicker picker = ImagePicker();

    image = await picker.pickImage(source: ImageSource.camera);
    emit(NewproductInitial());
  }

  Future<void> addProduct(context) async {
    DatabaseRepo db = DatabaseRepo();
    db.initDB();
    db.insertProduct(
      nameController.text,
      descController.text,
      0,
      int.parse(qntController.text),
      await image!.readAsBytes(),
    );
    await ProductCubit.instance.fetchProducts();
    Navigator.pop(context);
  }
}


