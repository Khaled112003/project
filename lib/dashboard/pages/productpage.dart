import 'package:auth/dashboard/product_control/product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth/dashboard/widgets/card_widget.dart';
import 'package:auth/dashboard/models/product_model.dart';
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..apper(), // Ensure fetch is called on creation
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserEmpty) {
            return const Center(
              child: Icon(
                CupertinoIcons.delete,
                size: 100,
                color: Colors.grey,
              ),
            );
          } else if (state is UserLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 40,
              ),
              itemCount: state.products.length,
              itemBuilder: (_, int index) {
                return customcard(productModel: state.products[index]);
              },
            );
          } else if (state is UserError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}