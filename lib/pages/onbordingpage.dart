import 'package:auth/body/onbording_body.dart';
import 'package:auth/body/onbordingbuttonswid.dart';
import 'package:auth/controler/onboardingcubit/onbordingcontrolstate.dart';
import 'package:auth/controler/onboardingcubit/onbordingcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnbordingPage extends StatelessWidget {
  OnbordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => onbordingcontrol_cubit(),
      child: BlocBuilder<onbordingcontrol_cubit, onbordingstate>(
        builder: (context, state) {
          onbordingcontrol_cubit controler =
              context.read<onbordingcontrol_cubit>();

          return Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [
                
                Column(
                  children: [
                    Expanded(
                      child: OnbordingBody(controler: controler),
                    ),
                   
                  ],
                  
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: onbordingbuttonswidget(controler: controler),)
              ],
            ),
          );
        },
      ),
    );
  }
}
