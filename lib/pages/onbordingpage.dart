import 'package:auth/body/onbording_body.dart';
import 'package:auth/body/onbordingbuttonswid.dart';
import 'package:auth/controler/cubits/onbordingcontrolstate.dart';
import 'package:auth/controler/cubits/onbordingcubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class onbordingpage extends StatelessWidget {
  onbordingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => onbordingcontrol_cubit(),
      child: BlocBuilder<onbordingcontrol_cubit, onbordingstate>(
        builder: (context, state) {
          onbordingcontrol_cubit controler =
              context.read<onbordingcontrol_cubit>();

          return Scaffold(
            body: onbordingbody(controler: controler),
            bottomNavigationBar: onbordingbuttonswidget(controler: controler,),
          );
        },
      ),
    );
  }
}


