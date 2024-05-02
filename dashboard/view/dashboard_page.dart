import 'package:auth/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class dashboard_page extends StatelessWidget {
  const dashboard_page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Dashboard_Cubit(),
      child: BlocBuilder<Dashboard_Cubit, DashboardCubitState>(
        builder: (context, state) {
          Dashboard_Cubit control=context.read<Dashboard_Cubit>();

          return Scaffold(
            appBar: AppBar(), 
            body: PageView(
              controller: control.pagecontrol,
              onPageChanged: control.onchange,
              children: [Text("product"), Text("fav"), Text("card")],
            ),
              bottomNavigationBar: BottomNavigationBar(
              currentIndex: control.count,
              onTap: control.onchange,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              unselectedLabelStyle: const TextStyle(fontSize: 15, color: Colors.red),
              items:  [
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.collections), label: 'products'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: 'fav'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: 'card'),
              ],
            ),
          );
        },
      ),
    );
  }
}

