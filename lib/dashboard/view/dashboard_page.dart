import 'package:auth/dashboard/dashboard_control/dashboard_cubit.dart';
import 'package:auth/dashboard/pages/productpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class dashboard_page extends StatelessWidget {
 const dashboard_page({super.key});
 final List title = const["products", 'fav', 'cart'];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Dashboard_Cubit(),
      child: BlocBuilder<Dashboard_Cubit, DashboardCubitState>(
        builder: (context, state) {
          Dashboard_Cubit control = context.read<Dashboard_Cubit>();

          return Scaffold(
            appBar: AppBar(
              title: Text(title[control.count]),
            ),
            body: PageView(
              controller: control.pagecontrol,
              onPageChanged: control.onchange,
              children: [
                product_page()
                , Text("fav"), Text("cart")],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: control.count,
              onTap: control.onchange,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              unselectedLabelStyle:
                  const TextStyle(fontSize: 15, color: Colors.red),
              items:const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.collections), label: 'products'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.heart), label: 'fav'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.cart), label: 'card'),
              ],
            ),
          );
        },
      ),
    );
  }
}
