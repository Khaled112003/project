import 'package:auth/controler/onboardingcubit/onbordingcontrolstate.dart';
import 'package:auth/controler/onboardingcubit/onbordingcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnbordingBody extends StatelessWidget {
  OnbordingBody({
    required this.controler,
    super.key,
  });
  final onbordingcontrol_cubit controler;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<onbordingcontrol_cubit>.value(
      value: controler,
      child: BlocBuilder<onbordingcontrol_cubit, onbordingstate>(
        builder: (context, state) {
          return PageView(
            controller: controler.PageControler,
            children: List.generate(controler.data.length, (index) {
              return Stack(
                children: [
                  Image.network(
                    controler.data[index].image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    top: 80, // Adjust to position text above bottomNavigationBar
                    left: 20,
                    right: 20,
                    child: Column(
                     children: [
                      
                        Text(
                          controler.data[index].txt,
                          style:const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            // backgroundColor: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          controler.data[index].txt2,
                          style:const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 236, 11, 11),
                            // backgroundColor: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
