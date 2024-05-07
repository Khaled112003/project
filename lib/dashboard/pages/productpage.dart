
import 'package:auth/dashboard/product_control/product_cubit.dart';
import 'package:auth/dashboard/widgets/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class product_page extends StatelessWidget {
  const product_page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          ProductCubit controler=context.read<ProductCubit>();
          return Scaffold(
            body: 
            state is UserLoading
                ? const CircularProgressIndicator()
                : state is UserEmpty
                    ? const Center(
                        child: Icon(
                        CupertinoIcons.delete,
                        size: 100,
                        color: Colors.grey,
                        
                      )
                       )
                      
                    :
                    GridView.builder(clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 40,
                    ),
                    itemCount:controler.product_list.length , itemBuilder: (_, int index) {
                     
                           customcard(productModel: controler.product_list[index],);
                             
                        }) ,
                         
          
              );
        },
      ),
    );
  }
}