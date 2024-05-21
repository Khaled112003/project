import 'package:auth/widget/cusstomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/newproduct_cubit.dart';

class NewproductPage extends StatelessWidget {
  const NewproductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewproductCubit(),
      child: BlocBuilder<NewproductCubit, NewproductState>(
        builder: (context, state) {
          final NewproductCubit control = context.read<NewproductCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "please write new product",
                style: TextStyle(fontSize: 25),
              ),
            ),
            body: Column(
              children: [
                const Text(" write product name",
                    style: TextStyle(fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                customtextfiald(hintText: 'name'),
                const SizedBox(
                  height: 10,
                ),
                const Text(" write product describtion",
                    style: TextStyle(fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                customtextfiald(hintText: 'describtion'),
                const SizedBox(
                  height: 10,
                ),
                const Text(" write product available count",
                    style: TextStyle(fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                customtextfiald(
                  hintText: 'available count',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: control.pickProductImage,
                        icon: const Icon(CupertinoIcons.photo ,color: Color.fromARGB(255, 0, 156, 254),)),
                    IconButton(
                        onPressed: control.takeProductImage,
                        icon: const Icon(CupertinoIcons.camera, color: Color.fromARGB(255, 6, 122, 255),)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
