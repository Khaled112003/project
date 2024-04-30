import 'package:auth/pages/onbordingpage.dart';
import 'package:auth/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
    final shared=await SharedPreferences.getInstance() ;
  bool onbording=shared.getBool("onbording")??false;
  runApp( MyApp(onbording: onbording,));

}
class MyApp extends StatelessWidget {
   MyApp({super.key,required this.onbording});
  final bool onbording;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:onbording?Signin():onbordingpage(),
    );
  }
}
