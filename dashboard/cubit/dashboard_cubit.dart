

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

class Dashboard_Cubit extends Cubit<DashboardCubitState> {
  PageController pagecontrol=PageController();
  Dashboard_Cubit() : super(DashboardCubitInitial());
  int count=0;
  void onchange(index){
  count=index;
  pagecontrol.jumpToPage(index);
  emit(DashboardCubitInitial());
  
  }
  
}
