 

import 'package:auth/controler/onboardingcubit/onbordingcontrolstate.dart';
import 'package:auth/models/bordingmodel.dart';

import 'package:auth/pages/signin.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class onbordingcontrol_cubit extends Cubit<onbordingstate> {
  onbordingcontrol_cubit() : super(onbordinginitialstate());
PageController PageControler =PageController();


 void next(BuildContext context) async {
    if (PageControler.page == data.length - 1) {
      final shared = await SharedPreferences.getInstance();
      await shared.setBool('onbording', true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Signin();
      }));
    } else {
      PageControler.nextPage(duration: Duration(seconds: 1), curve: Curves.bounceIn);
    }
  }
void skip(BuildContext context)async{
  final shared=await SharedPreferences.getInstance() ;
   await shared.setBool('onbording', true);
   
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Signin();
  },));
}


  List data =[
    
    onbordinmodel(txt: 'Welcome\n to', txt2: " ElSOOK", image: "https://www.cato.org/sites/cato.org/files/styles/aside_3x/public/2023-11/fast-fashion2.jpeg?itok=72ek8bxI"),
    onbordinmodel(txt: 'SALE 30%\n on all products', txt2: " ", image: "https://www.searchenginejournal.com/wp-content/uploads/2022/08/google-shopping-ads-6304dccb7a49e-sej-1280x720.png"),
    onbordinmodel(txt: "Highest\n quality\n and\n cheapest\n price", txt2: " ", image: "https://t3.ftcdn.net/jpg/02/41/43/18/360_F_241431868_8DFQpCcmpEPVG0UvopdztOAd4a6Rqsoo.jpg")
  ];
}
