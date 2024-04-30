import 'package:flutter/material.dart';

import '../widget/cusstomtextfield.dart';


class newpassword extends StatelessWidget {
  const newpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Center(
            child: Text(
          'New Password',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
          Text("enter your new password:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
          SizedBox(height: 5,),
          customtextfiald(hintText: "new password",obscureText: true,),
          SizedBox(height: 25,),
          Text("Confirm password:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
          SizedBox(height: 5,),
          customtextfiald(hintText: "confirm new password",obscureText: true,)
        
        
        
        ],),
      ),
    );
  }
}





